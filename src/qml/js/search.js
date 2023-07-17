function search(MainStore, keyword) {
    // 清空
    MainStore.search.data = [];
    // 查找
    var objs = MainStore.chassis.search(keyword);
    MainStore.search.data = [...MainStore.search.data, ...objs];
    objs = MainStore.location.search(keyword);
    MainStore.search.data = [...MainStore.search.data, ...objs];
    objs = MainStore.security.search(keyword);
    MainStore.search.data = [...MainStore.search.data, ...objs];
    objs = MainStore.vehicle.search(keyword);
    MainStore.search.data = [...MainStore.search.data, ...objs];
    objs = MainStore.hc.search(keyword);
    MainStore.search.data = [...MainStore.search.data, ...objs];

    return MainStore.search.data.length > 0;
}
