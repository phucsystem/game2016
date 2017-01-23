
//Loads the correct sidebar on window load,
//collapses the sidebar on window resize.
// Sets the min-height of #page-wrapper to window size
$(function() {
     // Validate form


 $('.tagsinput').tagsinput({
      allowDuplicates: false,
        itemValue: 'id',  // this will be used to set id of tag
        itemText: 'label' // this will be used to set text of tag
    });

    $('.select2').select2();
    
    
    /*
     * Validate on tab change
     */
//    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
//        if (!$(".form-validate").validationEngine('validate')) {
//            e.preventDefault();
//            return false;
//        }
//    });
    

});
