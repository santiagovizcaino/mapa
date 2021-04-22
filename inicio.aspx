<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="inicio.aspx.vb" Inherits="GOOGLEMAP.inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Google map</title>
    <link rel="stylesheet" href="http//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-min.css" />
    <link rel="stylesheet" href="http//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-glyphicons.css" />
    <link rel="stylesheet" href="http//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-theme.min.css" />
    <script src="https //code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="http//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-min.js" ></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <script type="text/javascript" src='https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places&key=AIzaSyCHn4psmOMJgcGSUqkI3ACcxoCuVONGwX4'></script>
    <script src="JS/locationpicker.jquery.js"></script>
</head>
<body>
    <form id="form1" runat="server">
           <div class="container">
        <button type="button" data-toggle="modal" data-target="#ModalMap" class="btn btn-default">
        <span class="glyphicon glyphicon-map-marker"></span><span id="ubicacion">Seleccionar una ubicacion</span>
        </button>
               <style> 
                   .pac-container {
                       z-index:99999;
                   }
               </style>
               <div class="modal fade" id="ModalMap" tabindex="-1" role="dialog">
                   <div class="modal-dialog" role="document">
                       <div class="modal-content">
                           <div class="modal-body">
                               <div class="form-horizontal">
                                   <div class="form-group">
                                       <label class="col-sm-2 control-label">ubicacion</label> 
                                       <div class="col-sm-9">
                                           <asp:TextBox ID="ModalMapaddress" CssClass="form-control" runat="server"></asp:TextBox>

                                       </div>
                                       <div class="col-sm-1">
                                           <button type="button" class="close" data-dismiss="modal"  aria-label="Cerrar">
                                               <span aria-hidden="true">&times;</span>
                                           </button>                                    

                                       </div>
                                   </div>
                                   <div id="ModalMapPreview" style="width:100%; height:400px"></div>
                                   <div class="clearfix">&nbsp;</div>
                                   <div class="m-t-small">
                                       <label class="p-r-small col-sm-1 control-label">lat.</label>
                                       <div class="col-sm-3">
                                       <asp:TextBox ID="ModalMapaLat" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                       <label class="p-r-small col-sm-1 control-label">lon.</label>
                                       <div class="col-sm-3">
                                       <asp:TextBox ID="ModalMapLon" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-3">
                                       <button type="button" class="btn btn-primary btn-block" data-dismiss="modal">Aceptar</button>
                                        </div>
                                     </div>
                                   <div class="clearfix"></div>
                                   <script>
                                       $('#ModalMapPreview').locationpicker({
                                           radius:0,
                                           location: {
                                               latitude: -0.225219,
                                               longitude: -78.5248
                                           },
                                           enableAutocomplete: true,
                                           inputBinding: {
                                               latitudeInput:$('#<%=ModalMapaLat.ClientID%>'),
                                               longitudeInput:$('#<%=ModalMapLon.ClientID%>'),
                                               locationNameInput:$('#<%=ModalMapaddress.ClientID%>')
                                           },
                                           onchanged: function (currentLocation,radius,isMarkerDropped) {
                                               $('#ubicacion').html($('#<%=ModalMapaddress.ClientID%>').val());
                                           }
                                       });
                                       $('#ModalMap').on('shown.bs.modal', function () {
                                           $('#ModalMapPreview').locationpicker('autosize');
                                       })
                                   </script>
                               </div>
                           </div>
                       </div>
                   </div>

               </div>
    </div>
    </form>
</body>
</html>
