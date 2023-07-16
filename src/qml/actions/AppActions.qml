pragma Singleton
import QtQuick 2.0
import QuickFlux 1.1

ActionCreator {
    // 上一步
    signal toPrevPage()
    // 下一步
    signal toNextPage()
    
    // 更新安装朝向
    signal updateInstallDirection(int index)
    // 加载底盘动态页面
    signal loadChassisDynmicPage(var parent, var data)
    
    // 下拉框索引改变
    signal comboxIndexChanged(var combox)
}