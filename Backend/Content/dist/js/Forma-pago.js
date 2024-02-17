$("#sltForma-pago").click(function(){
if($("#sltForma-pago").val() == "Tarjeta"){
$("#sltTarjeta").removeAttr("hidden");
$("#txtTarjeta").removeAttr("hidden");
$("#txtCVV").removeAttr("hidden");
$("#txtFechaExp").removeAttr("hidden");

}else{
    $("#sltTarjeta").attr("hidden",true);
    $("#txtTarjeta").attr("hidden",true);
    $("#txtCVV").attr("hidden",true);
    $("#txtFechaExp").attr("hidden",true);
}
});