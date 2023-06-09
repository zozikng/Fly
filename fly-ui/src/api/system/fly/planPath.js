import request from '@/utils/request'

// 查询无人机历史路径列表
export function planPathList(data) {
  return request({
    url: '/fly/planpath/list',
    method: 'post',
    data: data
  })
}

// 查询无人机历史路径列表详细
export function planPathQuery(id) {
  return request({
    url: '/fly/planpath/details/' + id,
    method: 'get'
  })
}

// 上传无人历史路径机列表
export const uploadPlanPath=(data) =>{
  return request({
    url: '/fly/planpath/upload',
    method: 'post',
    data: data
  })
}


// 删除无人机历史路径列表
export function deletePlanPath(id) {
  return request({
    url: '/fly/planpath/delete/' + id,
    method: 'get'
  })
}

// 修改无人机列表
export function updatePlanPath(data) {
  return request({
    url: '/fly/planpath/edit',
    method: 'Post',
    data: data
  })
}
