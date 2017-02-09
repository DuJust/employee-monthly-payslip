/*global EmployeePayslip*/

EmployeePayslip.FileInputChange = function () {
  return {
    setContent: function ($target, element) {
      var name;

      if (_.isObject(element) && _.isObject(element.files) && _.isObject(element.files[0]) && _.isString(element.files[0].name))
        name = element.files[0].name;

      if (_.isNull(name) || name === '')
        name = $target.attr('data-original-content');

      if (!$target.attr('data-original-content')) $target.attr('data-original-content', $target.attr('data-content'));

      $target.attr('data-content', name);
    },
    onChange: function (event) {
      var $element = $(event.target);
      var $target = $($element.data('target'));

      if (!$target.length) return console.error('Invalid target for custom file', $element);

      if (!$target.attr('data-content')) return console.error('Invalid `data-content` for custom file target', $element);

      EmployeePayslip.FileInputChange.setContent($target, $element.get(0));
    },
    bindChangeEvent: function () {
      $('body').on('change', 'input[type="file"][data-toggle="custom-file"]', EmployeePayslip.FileInputChange.onChange);
    }
  };
}.call();

$(function () {
  EmployeePayslip.FileInputChange.bindChangeEvent();
});
