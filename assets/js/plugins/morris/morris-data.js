// Morris.js Charts sample data for SB Admin template

$(function () {

    if ($("#morris-area-chart").length > 0) {
        var roundRecord = $.parseJSON(teamRecords);
        var roundIndex = 0;
        var scaleRate = 1;
        for (i = roundRecord.length; i > 0; i--) {
            if (roundRecord[i - 1].Money !== 0) {
                roundIndex = i - 1;
                break;
            }
        }

        // Area Chart
        Morris.Bar({
            element: 'morris-area-chart',
            data: roundRecord,
            xkey: 'period',
            ykeys: ['ECO', 'SO', 'ME'],
            labels: ['ECO Credits (points)', 'SO Credits (points)', 'ME Credits (points)'],
            pointSize: 1.5,
            hideHover: 'auto',
            resize: true,
            smooth: true
        });
    }

    if ($("#morris-line-chart").length > 0) {
        var roundRecord = $.parseJSON(teamRecords);
        var roundIndex = 0;

        console.log(roundRecord);

        var moneyLabel = '$';
        if (roundRecord[roundIndex] !== null) {
            if (roundRecord[roundIndex].Money >= 1000 && roundRecord[roundIndex].Money <= 999999) {
                scaleRate = 1000;
                moneyLabel = 'thoud. $';
            } else if (roundRecord[roundIndex].Money >= 1000000) {
                scaleRate = 1000000;
                moneyLabel = 'million. $';
            } else if (roundRecord[roundIndex].Money >= 100 && roundRecord[roundIndex].Money <= 999) {
                scaleRate = 100;
                moneyLabel = 'hundred $';
            }
        }

        for (i = roundRecord.length; i > 0; i--) {
            if (roundRecord[i - 1].Money !== 0) {
                roundRecord[i - 1].Money = roundRecord[i - 1].Money / scaleRate;
            }else{
//                roundRecord[i - 1].period = roundRecord[i - 1].period.replace('Round', '');
                roundRecord[i - 1].Money = null;
            }
            
        }

        Morris.Line({
            element: 'morris-line-chart',
            data: roundRecord,
            xkey: 'period',
            ykeys: ['Money'],
            labels: ['Money (' + moneyLabel + ')'],
            parseTime: false,
             continuousLine: true
        });
    }

    if ($("#morris-report-chart123").length > 0) {
        var roundRecord2 = $.parseJSON(customerReportData);
        // Area Chart
        Morris.Bar({
            element: 'morris-report-chart123',
            data: roundRecord2,
            xkey: 'region',
            xLabels: ['Round1'],
            ykeys: ['1', '2', '3'],
            labels: ['Poor Student', 'Heavy User', 'Eco Hipster'],
            pointSize: 1.5,
            hideHover: 'auto',
            resize: true,
            smooth: true,
           
        });

        setTimeout(function () {
            $(window).trigger('resize');
        }, 1000)


    }



    if ($("#morris-report-marketshare-1").length > 0) {

        Morris.Donut({
            element: 'morris-report-marketshare-1',
            data: $.parseJSON(dcMarketData),
            pointSize: 1.5,
            hideHover: 'auto',
            resize: true,
            smooth: true
        });
    }

    if ($("#morris-report-marketshare-2").length > 0) {
        Morris.Donut({
            element: "morris-report-marketshare-2",
            data: $.parseJSON(ec1MarketData),
            pointSize: 1.5,
            hideHover: 'auto',
            resize: true,
            smooth: true
        });
    }

    if ($("#morris-report-marketshare-3").length > 0) {
        Morris.Donut({
            element: 'morris-report-marketshare-3',
            data: $.parseJSON(ec2MarketData),
            pointSize: 1.5,
            hideHover: 'auto',
            resize: true,
            smooth: true
        });
    }

    if ($("#morris-report-marketshare-4").length > 0) {
        Morris.Donut({
            element: 'morris-report-marketshare-4',
            data: $.parseJSON(icMarketData),
            pointSize: 1.5,
            hideHover: 'auto',
            resize: true,
            smooth: true
        });
    }




});
