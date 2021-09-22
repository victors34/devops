var chart = Highcharts.chart('container', {
    chart: {
        type: 'line'
    },
    title: {
        text: '网站访问量'
    },
    subtitle: {
        text: '数据来源: ingress'
    },
    xAxis: {
        categories: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
    },
    yAxis: {
        title: {
            text: '网站访问量'
        }
    },
    plotOptions: {
        line: {
            dataLabels: {
                // 开启数据标签
                enabled: true
            },
            // 关闭鼠标跟踪，对应的提示框、点击事件会失效
            enableMouseTracking: false
        }
    },
    series: [{
        name: '访问量 PV',
        data: [7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2]
    }, {
        name: '访问用户数 UV',
        data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0]
    }]
});