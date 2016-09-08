$(document).ready(function() {
    $('.date').mask('Dd/Mm/0000', {
        'translation': {
            D: { pattern: /[0-3]/ },
            d: { pattern: /[0-9]/ },
            M: { pattern: /[0-1]/ },
            m: { pattern: /[0-9]/ }
        }
    });

});
