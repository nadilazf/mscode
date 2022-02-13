<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Comment.ascx.cs" Inherits="Transforman.Web.Costumer.Comment" %>


<div class="table-responsive">
    <table class="table table-striped table-bordered table-hover" id="comment-table">

        <thead>
            <tr>
                <th>Date</th>
                <th>Activity</th>
                <th>User</th>
                <th>Comments</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>


    <script>

        var _ListComment = '<%= ListComment %>'

        var data = (_ListComment == '' ? [] : jQuery.parseJSON(_ListComment));



        var oDatacomment = $('#comment-table').dataTable({
            "sPaginationType": "full_numbers",
            "bSort": false,
            "bFilter": false,
            "bPaginate": false,
            "aoColumns": [

                { "mDataProp": "Date" },
                { "mDataProp": "Activity" },
                { "mDataProp": "User" },
                { "mDataProp": "Comments" }
              

            ]
        });



        if (data.length > 0) {

            for (var i = 0; i < data.length; i++) {



                NewData = new Object();
                NewData.Date = data[i]["DateActivity"];
                NewData.Activity = data[i]["Activity"];
                NewData.User = data[i]["Nama"];
                NewData.Comments = data[i]["Comments"];
              
               
                oDatacomment.fnAddData(NewData);

            }


        }

    </script>
</div>
