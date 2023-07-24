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
    // 生成结果
    signal generateFileResult(int result);
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
}