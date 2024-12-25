<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.student.dao.ScoreDao" %>
<%@ page import="com.student.po.Score" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>

<html>
<head>
    <title>成绩可视化</title>
    <script src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
</head>
<body bgcolor="#f5f5dc">
<div style="text-align:center">
    <h1 style="color:orange;">学生成绩可视化</h1>
    <div id="main" style="width: 80%; height: 500px; margin: 0 auto;"></div>
</div>

<%
    ScoreDao scoreDao = new ScoreDao();
    List<Score> scores = scoreDao.getAllScores();

    // 使用哈希表统计每个总分对应的人数
    HashMap<Double, Integer> scoreCountMap = new HashMap<>();

    for (Score score : scores) {
        double totalScore = score.getTotalScore();
        scoreCountMap.put(totalScore, scoreCountMap.getOrDefault(totalScore, 0) + 1);
    }

    // 初始化总分和人数数组
    StringBuilder totalScores = new StringBuilder("[");
    StringBuilder countStudents = new StringBuilder("[");

    int index = 0;
    for (Map.Entry<Double, Integer> entry : scoreCountMap.entrySet()) {
        totalScores.append(entry.getKey());
        countStudents.append(entry.getValue());

        if (index < scoreCountMap.size() - 1) {
            totalScores.append(", ");
            countStudents.append(", ");
        }
        index++;
    }

    totalScores.append("]");
    countStudents.append("]");
%>

<script type="text/javascript">
    var totalScores = <%= totalScores.toString() %>;
    var countStudents = <%= countStudents.toString() %>;

    var myChart = echarts.init(document.getElementById('main'));

    var option = {
        title: {
            text: '各总分对应的人数'
        },
        tooltip: {},
        xAxis: {
            type: 'category',
            name: '总分',
            data: totalScores
        },
        yAxis: {
            type: 'value',
            name: '人数'
        },
        series: [{
            name: '人数',
            type: 'bar',
            data: countStudents,
            itemStyle: {
                color: 'rgba(135, 206, 235, 0.8)',
            },
        }]
    };

    myChart.setOption(option);
</script>
</body>
</html>