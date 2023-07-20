pragma Singleton
import QtQuick 2.0
import QuickFlux 1.1

ActionCreator {
    // 上一步
    signal toPrevPage();
    // 下一步
    signal toNextPage();
    // 生成
    signal generateFile();
    // 去到指定向导页面
    signal toNextWizardPage(int index);
    // 页面加载状态改变
    signal loaderStatusChanged(int status);
    // 显示等待框
    signal showBusy(bool visible);
    
    // 关键字搜索
    signal searchKeyword(string keyword);
    // 加载搜索页面
    signal loadSearchResultPage(var parent);
    // 返回上一页面
    signal goBack();
    
    // 更新安装朝向
    signal updateInstallDirection(int index);
    // 加载底盘动态页面
    signal loadChassisDynmicPage(var parent);
    // 加载定位感知动态页面
    signal loadLocationDynmicPage(var parent);
    // 加载安全防护动态页面
    signal loadSecurityDynmicPage(var parent);
    // 加载载具功能动态页面
    signal loadVehicleDynmicPage(var parent);
    // 加载人机交互动态页面
    signal loadHCInteractionDynmicPage(var parent);
    
    // 下拉框索引改变
    signal comboxIndexChanged(var combox);
    // 编辑框编辑完成
    signal lineEditingFinished(var edit);
}