﻿$('#demo').pagination({
    dataSource: [1, 2, 3, 4, 5, 6, 7, ... , 100],
    pageSize: 10,
    showPrevious: false,
    showNext: false,
    callback: function(data, pagination) {
        // template method of yourself
        var html = template(data);
        dataContainer.html(html);
    }
})
