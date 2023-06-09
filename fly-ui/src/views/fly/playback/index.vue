<template>
  <div class="app-container">
    <el-row :gutter="20">
      <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch"
               label-width="68px"
      >
        <el-form-item label="名称" prop="droneName">
          <el-input
            v-model="queryParams.droneName"
            placeholder="请输入无人机名称"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="型号" prop="model">
          <el-input
            v-model="queryParams.model"
            placeholder="请输入无人机型号"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="用户id" prop="userId">
          <el-input
            v-model="queryParams.userId"
            placeholder="请输入用户id"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="用户名称" prop="username">
          <el-input
            v-model="queryParams.username"
            placeholder="请输入用户名称"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="电池电量" prop="currentBatteryLevel">
          <el-input
            v-model="queryParams.currentBatteryLevel"
            placeholder="请输入当前电池电量"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-select v-model="queryParams.status"
                     placeholder="请输入状态"
                     clearable
                     @keyup.enter.native="handleQuery"
          >
            <el-option
              v-for="dict in dict.type.drone_status"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-form>

      <el-row :gutter="10" class="mb8">
        <el-col :span="1.5">
          <el-button
            type="primary"
            plain
            icon="el-icon-plus"
            size="mini"
            @click="handleAdd"
          >新增
          </el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="success"
            plain
            icon="el-icon-edit"
            size="mini"
            :disabled="single"
            @click="handleUpdate"
          >修改
          </el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="danger"
            plain
            icon="el-icon-delete"
            size="mini"
            :disabled="multiple"
            @click="handleDelete"
          >删除
          </el-button>
        </el-col>
        <!--          <el-col :span="1.5">-->
        <!--            <el-button-->
        <!--              type="warning"-->
        <!--              plain-->
        <!--              icon="el-icon-download"-->
        <!--              size="mini"-->
        <!--              @click="handleExport"-->
        <!--              v-hasPermi="['system:drone:export']"-->
        <!--            >导出-->
        <!--            </el-button>-->
        <!--          </el-col>-->
        <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
      </el-row>

      <el-table v-loading="loading" :data="droneList" @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" align="center"/>
        <el-table-column label="无人机id" align="center" key="droneId" prop="droneId"/>
        <el-table-column label="无人机名称" align="center" key="droneName" prop="droneName"/>
        <el-table-column label="无人机型号" align="center" key="model" prop="model"/>
        <el-table-column label="用户id" align="center" key="userId" prop="userId"/>
        <el-table-column label="用户名称" align="center" key="username" prop="username"/>
        <el-table-column label="终端北斗卡号" align="center" key="cardId" prop="cardId"/>
        <el-table-column label="当前电池电量" align="center" key="currentBatteryLevel" prop="currentBatteryLevel"/>
        <el-table-column label="状态" align="center" key="status" prop="status">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.drone_status" :value="scope.row.status"/>
          </template>
        </el-table-column>
        <el-table-column label="信号强度" align="center" key="signal" prop="signal">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.drone_signal" :value="scope.row.signal"/>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="160" class-name="small-padding fixed-width">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="handleUpdate(scope.row)"
            >修改
            </el-button>
            <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="handleDelete(scope.row)"
            >删除
            </el-button>
            <el-dropdown size="mini" @command="(command) => handleCommand(command, scope.row)"
            >
              <el-button size="mini" type="text" icon="el-icon-d-arrow-right">更多</el-button>
              <el-dropdown-menu slot="dropdown">
                <el-dropdown-item command="handlePlayback" icon="el-icon-map-location"

                >回放轨迹
                </el-dropdown-item>
                <el-dropdown-item command="handlePlanPath" icon="el-icon-circle-check"
                >规划航迹
                </el-dropdown-item>
              </el-dropdown-menu>
            </el-dropdown>
          </template>
        </el-table-column>
      </el-table>

      <pagination
        v-show="total>0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="getList"
      />
    </el-row>
    <!-- 添加或修改无人机列表对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" :center="true" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="终端id" prop="droneId">
          <el-input v-model="form.droneId" placeholder="请输入无人机id"/>
        </el-form-item>
        <el-form-item label="名称" prop="droneName">
          <el-input v-model="form.droneName" placeholder="请输入无人机名称"/>
        </el-form-item>
        <el-form-item label="型号" prop="model">
          <el-input v-model="form.model" placeholder="请输入无人机型号"/>
        </el-form-item>
        <el-form-item label="卡号" prop="cardId">
          <el-input v-model="form.cardId" placeholder="请输入无人机卡号"/>
        </el-form-item>
        <!--        <el-form-item label="电量" prop="currentBatteryLevel">-->
        <!--          <el-input v-model="form.currentBatteryLevel" placeholder="请输入当前电池电量" />-->
        <!--        </el-form-item>-->
        <!--        <el-form-item label="状态" prop="status">-->
        <!--          <el-radio-group v-model="form.status">-->
        <!--            <el-radio-->
        <!--              v-for="dict in dict.type.drone_status"-->
        <!--              :key="dict.value"-->
        <!--              :label="dict.value"-->
        <!--            >{{dict.label}}</el-radio>-->
        <!--          </el-radio-group>-->
        <!--        </el-form-item>-->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listDrone, getDrone, delDrone, addDrone, updateDrone } from '@/api/system/fly/drone'

export default {
  name: 'index',
  dicts: ['drone_status', 'drone_signal'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 无人机列表表格数据
      droneList: [],
      // 弹出层标题
      title: '',
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        droneName: null,
        model: null,
        userId: null,
        username: null,
        currentBatteryLevel: null,
        status: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        droneId: [
          { required: true, message: "飞行器Id不能为空", trigger: "blur" },
          { min: 5, max: 20, message: '飞行器Id长度必须介于 5 和 20 之间', trigger: 'blur' }
        ],
        droneName: [
          { required: true, message: "飞行器名称不能为空", trigger: "blur" }
        ],
        model: [
          { required: true, message: "飞行器型号不能为空", trigger: "blur" },
        ],
        cardId: [
          { required: true, message: "北斗卡号不能为空", trigger: "blur" },
        ],
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询无人机列表列表 */
    getList() {
      this.loading = true
      listDrone(this.queryParams).then(response => {
        this.droneList = response.items
        this.total = response.total
        this.loading = false
      })
      console.log(this.droneList)
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        droneName: null,
        model: null,
        userId: null,
        username: null,
        currentBatteryLevel: null,
        status: null
      }
      this.resetForm('form')
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm('queryForm')
      this.handleQuery()
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = '添加无人机列表'
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const id = row.id || this.ids
      getDrone(id).then(response => {
        this.form = response.data
        console.log(JSON.stringify(this.form))
        this.open = true
        this.title = '修改无人机列表'
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs['form'].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateDrone(this.form).then(response => {
              this.$modal.msgSuccess('修改成功')
              this.open = false
              this.getList()
            })
          } else {
            addDrone(this.form).then(response => {
              this.$modal.msgSuccess('新增成功')
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids
      this.$modal.confirm('是否确认删除名称为"' + row.droneName + '"无人机，其规划的路线和历史路径也会被删除').then(function() {
        return delDrone(ids)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess('删除成功')
      }).catch(() => {
      })
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/drone/export', {
        ...this.queryParams
      }, `drone_${new Date().getTime()}.xlsx`)
    },
    // 更多操作触发
    handleCommand(command, row) {
      switch (command) {
        case 'handlePlayback':
          this.handlePlayback(row)
          break
        case 'handlePlanPath':
          this.handlePlanPath()
          break
        default:
          break
      }
    },
    /** 跳转地图 */
    handlePlayback(row) {
      this.$router.push({ path: '/fly/flylist-map/playbackmap', query: { row: row } });
    },
    /**
     * 跳转轨迹规划
     */
    handlePlanPath(){
      this.$router.push({ path: '/fly/flyline'});
    }
  }
}
</script>
