#' accountDetail生成器界面
#'
#' @param colTitles  主页标题
#' @param widthRates 左右比例
#' @param func_left 左函数
#' @param func_right 右函数
#' @param tabTitle 标题
#' @param func_bottom  下面一栏
#'
#' @return 返回值
#' @import tsui
#' @export
#'
#' @examples
#' accountDetailUI()
accountDetailUI <- function(tabTitle ='银行流水',
                        colTitles =c('操作区域','操作区域','显示区域'),
                        widthRates =c(6,6,12),
                        func_left = accountDetailUI_left,
                        func_right =accountDetailUI_right,
                        func_bottom = accountDetailUI_bottom
) {

  #三栏式设置，可以复制
  res = tsui::uiGen3(tabTitle = tabTitle,colTitles =colTitles,widthRates = widthRates,func_left = func_left,func_right = func_right,func_bottom = func_bottom )
  return(res)

}





#' 请输入文件
#'
#' @return 返回值
#' @export
#'
#' @examples
#' accountDetailUI_left()
accountDetailUI_left <- function() {


  res <- tagList(
    tsui::mdl_date(id = 'date_startDate',label = '开始日期'),
    tsui::mdl_date(id = 'date_endDate',label = '结束日期')


  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' accountDetailUI_bottom()
accountDetailUI_right <- function() {
  res <- tagList(

    shiny::actionButton(inputId = 'btn_accountDetail_query',label = '查询'),
    tsui::mdl_download_button(id = 'dl_accountDetail',label = '下载数据')
  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' accountDetailUI_bottom()
accountDetailUI_bottom <- function() {
  res <- tagList(
    tsui::uiScrollX(tsui::mdl_dataTable(id = 'dt_accountDetail_resultView'))

  )
  return(res)

}
