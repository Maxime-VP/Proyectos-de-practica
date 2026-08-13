var ctx = document.getElementById("myChart").getContext("2d");

var myChart = new Chart(ctx, {
    type: "bar",
    data: {
        labels: ["col1", "col2", "col3"],
        datasets: [{
            label: "Num datos",
            data: [10, 9, 15],
            backgroundColor: [
                "rgba(255, 99, 132, 0.2)",
                "rgba(54, 162, 235, 0.2)",
                "rgba(255, 206, 86, 0.2)"
            ]
        }]
    }
});