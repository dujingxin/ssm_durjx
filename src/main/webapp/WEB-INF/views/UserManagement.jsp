<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Build CRUD Application with edit form in expanded row details - jQuery EasyUI Demo</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/jquery-easyui-1.5.4.5/themes/default/easyui.css" type="text/css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/jquery-easyui-1.5.4.5/themes/icon.css" type="text/css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/jquery-easyui-1.5.4.5/demo/demo.css" type="text/css" />

        <script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
        <script type="text/javascript" src="https://www.jeasyui.com/easyui/datagrid-detailview.js"></script>
    </head>

    <body class="easyui-layout">
        <div region="west" split="true" title="Navigator" style="width:150px;">
        </div>
        <div id="content" region="center" title="userLoginInfoList" style="padding:5px;">
            <table id="dg" class="easyui-datagrid"  title="userList" style="height:550px" url="${pageContext.request.contextPath}/user/userList" 
            toolbar="#toolbar" pagination="true" fitColumns="true" singleSelect="true">
                <thead>
                    <tr>
                        <th field="userid" width="50">USERID</th>
                        <th field="username" width="50">USERNAME</th>
                        <th field="password" width="50">PASSWORD</th>
                    </tr>
                </thead>
            </table>
            <div id="toolbar">
                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newItem()">New</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyItem()">Destroy</a>
            </div>
        </div>


        <script type="text/javascript">
            $(function () {
                $('#dg').datagrid({
                    view: detailview,
                    detailFormatter: function (index, row) {
                            return '<div class="ddv"></div>';
                        },
                        onExpandRow: function (index, row) {
                            var ddv = $(this).datagrid('getRowDetail', index).find('div.ddv');
                            ddv.panel({
                                border: false,
                                cache: true,
                                href: 'show_form.php?index=' + index,
                                onLoad: function () {
                                    $('#dg').datagrid('fixDetailRowHeight', index);
                                    $('#dg').datagrid('selectRow', index);
                                    $('#dg').datagrid('getRowDetail', index).find('form').form('load', row);
                                }
                            });
                            $('#dg').datagrid('fixDetailRowHeight', index);
                        }
                });
            });

            function saveItem(index) {
                var row = $('#dg').datagrid('getRows')[index];
                var url = row.isNewRecord ? 'save_user.php' : 'update_user.php?id=' + row.id;
                $('#dg').datagrid('getRowDetail', index).find('form').form('submit', {
                    url: url,
                    onSubmit: function () {
                            return $(this).form('validate');
                        },
                        success: function (data) {
                            data = eval('(' + data + ')');
                            data.isNewRecord = false;
                            $('#dg').datagrid('collapseRow', index);
                            $('#dg').datagrid('updateRow', {
                                index: index,
                                row: data
                            });
                        }
                });
            }

            function cancelItem(index) {
                var row = $('#dg').datagrid('getRows')[index];
                if (row.isNewRecord) {
                    $('#dg').datagrid('deleteRow', index);
                } else {
                    $('#dg').datagrid('collapseRow', index);
                }
            }

            function destroyItem() {
                var row = $('#dg').datagrid('getSelected');
                if (row) {
                    $.messager.confirm('Confirm', 'Are you sure you want to remove this user?', function (r) {
                        if (r) {
                            var index = $('#dg').datagrid('getRowIndex', row);
                            $.post('destroy_user.php', {
                                id: row.id
                            }, function () {
                                $('#dg').datagrid('deleteRow', index);
                            });
                        }
                    });
                }
            }

            function newItem() {
                $('#dg').datagrid('appendRow', {
                    isNewRecord: true
                });
                var index = $('#dg').datagrid('getRows').length - 1;
                $('#dg').datagrid('expandRow', index);
                $('#dg').datagrid('selectRow', index);
            }
        </script>
        <style type="text/css">
            form {
                margin: 0;
                padding: 0;
            }
            .dv-table td {
                border: 0;
            }
            .dv-table input {
                border: 1px solid #ccc;
            }
        </style>
    </body>

    </html>