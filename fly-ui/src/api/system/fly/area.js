import request from '@/utils/request'

// 查询无人机历史路径列表
export function areaList(data) {
  return request({
    url: '/fly/area/list',
    method: 'post',
    data: data
  })
}
export function areaListAll() {
  return request({
    url: '/fly/area/listall',
    method: 'post',
  })
}
// 查询无人机历史路径列表详细
export function areaQuery(id) {
  return request({
    url: '/fly/area/details/' + id,
    method: 'get'
  })
}

// 上传无人历史路径机列表
export const uploadArea=(data) =>{
  return request({
    url: '/fly/area/upload',
    method: 'post',
    data: data
  })
}


// 删除无人机历史路径列表
export function deleteArea(id) {
  return request({
    url: '/fly/area/delete/' + id,
    method: 'get'
  })
}

// 修改无人机列表
export function updateArea(data) {
  return request({
    url: '/fly/area/edit',
    method: 'post',
    data: data
  })
}
