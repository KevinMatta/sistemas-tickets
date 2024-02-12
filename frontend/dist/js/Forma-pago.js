$("#sltForma-pago").click(function(){
if($("#sltForma-pago").val() == "Tarjeta"){
$("#sltTarjeta").attr("hidden",false);
$("#txtTarjeta").attr("hidden",false);
$("#txtCVV").attr("hidden",false);
$("#txtFechaExp").attr("hidden",false);

}else{
    $("#sltTarjeta").attr("hidden",true);
    $("#txtTarjeta").attr("hidden",true);
    $("#txtCVV").attr("hidden",true);
    $("#txtFechaExp").attr("hidden",true);
}
});