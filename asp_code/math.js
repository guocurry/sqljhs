function Fractional(n) {
    //小数保留位数
    var bit = 2;
    //加上小数点后要扩充1位
    bit++;
    //数字转为字符串
    n = n.toString();
    //获取小数点位置
    var point = n.indexOf('.');
    //n的长度大于保留位数长度
    if (n.length > point + bit) {
        //保留小数后一位是否大于4，大于4进位
        if (parseInt(n.substring(point + bit, point + bit + 1)) > 2) {
            return n.substring(0, point) + "." + (parseInt(n.substring(point + 1, point + bit)) + 1);
        }
        else {
            return n.substring(0, point) + n.substring(point, point + bit);
        }
    }
    return n;
}
