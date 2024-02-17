function typeWriterEffect(text, elementId, speed) {
    const element = document.getElementById(elementId);

    function type() {
        let i = 0;
        function typing() {
            if (i < text.length) {
                element.innerHTML += text.charAt(i);
                i++;
                setTimeout(typing, speed);
            } else {
                // Una vez completada la escritura, reinicia el efecto
                setTimeout(reset, 2000); // Espera 2 segundos antes de reiniciar
            }
        }

        typing();
    }

    function reset() {
        element.innerHTML = '';
        type();
    }

    type();
}

// Llama a la función para iniciar el efecto
typeWriterEffect("Bienvenido a FM Tickets", "bienvenidos", 100);