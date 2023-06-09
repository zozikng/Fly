import request from '@/utils/request'

// 查询无人机历史路径列表
export function historyPathList(data) {
  return request({
    url: '/fly/historypath/list',
    method: 'post',
    data: data
  })
}

// 查询无人机历史路径列表详细
export function historyPathQuery(id) {
  return request({
    url: '/fly/historypath/details/' + id,
    method: 'get'
  })
}

// 上传无人历史路径机列表
export const uploadHistoryPath=(data) =>{
  return request({
    url: '/fly/historypath/upload',
    method: 'post',
    data: data
  })
}


// 删除无人机历史路径列表
export function deleteHistoryPath(id) {
  return request({
    url: '/fly/historypath/delete/' + id,
    method: 'get'
  })

}
// 修改无人机列表
export function updateHistoryPath(data) {
  return request({
    url: '/fly/historypatht/edit',
    method: 'Post',
    data: data
  })
}
