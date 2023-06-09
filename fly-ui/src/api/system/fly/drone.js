import request from '@/utils/request'

// 查询无人机列表列表
export function listDrone(data) {
  return request({
    url: '/fly/flylist/list',
    method: 'post',
    data: data
  })
}

// 查询无人机列表详细
export function getDrone(id) {
  return request({
    url: '/fly/flylist/details/' + id,
    method: 'get'
  })
}

// 新增无人机列表
export function addDrone(data) {
  return request({
    url: '/fly/flylist/add',
    method: 'post',
    data: data
  })
}

// 修改无人机列表
export function updateDrone(data) {
  return request({
    url: '/fly/flylist/edit',
    method: 'Post',
    data: data
  })
}

// 删除无人机列表
export function delDrone(id) {
  return request({
    url: '/fly/flylist/delete/' + id,
    method: 'get'
  })
}
