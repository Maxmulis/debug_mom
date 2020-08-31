const inputFiles = () =>{
  var inputs = document.querySelectorAll( '.inputfile' );
  Array.prototype.forEach.call( inputs, function( input )
  {
    var label  = input.previousElementSibling,
      labelVal = label.innerHTML;

    input.addEventListener( 'change', function( e )
    {
      var fileName = '';
      if( this.files && this.files.length > 1 ){
        fileName = ( this.getAttribute( 'data-multiple-caption' ) || '' ).replace( '{count}', this.files.length );
        console.log(this.files.length);
      } else {
        console.log(e.target.value)
        fileName = "Selected: " + e.target.value.split('\\').pop();
      }


      if( fileName ){
        document.querySelector( 'span' ).innerHTML = fileName;
      }
      else{
        label.innerHTML = labelVal;
      }
    });
  });
}

export { inputFiles };
