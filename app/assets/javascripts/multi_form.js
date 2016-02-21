$(document).on("ready", function(){
	var inputs = document.querySelectorAll( '.sandwich-file-input' );
	Array.prototype.forEach.call( inputs, function( input )
	{
		var label	 = input.nextElementSibling,
			labelVal = label.innerHTML;

		input.addEventListener( 'change', function( e )
		{
			var fileName = '';
			if( this.files && this.files.length > 1 )
				fileName = ( this.getAttribute( 'data-multiple_caption' ) || '' ).replace( '{count}', this.files.length );
			else
				fileName = e.target.value.split( '\\' ).pop();

			if( fileName )
				document.querySelector( '.files-picked' ).innerHTML = fileName;
			else
				label.innerHTML = labelVal;
		});
	});
})