//= require jquery
//= require employee_payslip
//= require file_input_change

describe('FileInputChange', function () {
  describe('on file input change', function () {
    var $element;

    beforeEach(function () {
      $('body').off('change', 'input[type="file"][data-toggle="custom-file"]');

      fixture.set('<input type="file" data-toggle="custom-file">');
      sinon.spy(EmployeePayslip.FileInputChange, 'onChange');
      EmployeePayslip.FileInputChange.bindChangeEvent();
    });

    afterEach(function () {
      EmployeePayslip.FileInputChange.onChange.restore();
    });

    it('should call onChange', function () {
      $element = $('input[type="file"][data-toggle="custom-file"]');
      $element.trigger('change');

      expect(EmployeePayslip.FileInputChange.onChange.calledOnce).to.equal(true);
    });
  });

  describe('setContent', function () {
    var $element, $target, files;

    beforeEach(function () {
      fixture.set('<span id="custom-text" data-content="Choose File"></span>');
      $target = $('#custom-text');
      $element = $('div');
      files = {0: {name: 'foo', size: 500001}};
      $element.files = files;
    });

    describe('when success', function () {
      it('should change target content', function () {
        EmployeePayslip.FileInputChange.setContent($target, $element);

        expect($target.data('content')).to.equal('foo');
        expect($target.data('original-content')).to.equal('Choose File');
      });
    });

    describe('when failure', function () {
      beforeEach(function () {
        EmployeePayslip.FileInputChange.setContent($target, $element);
      });

      describe('when given element does not exist', function () {
        it('should keep origin target content', function () {
          $element = undefined;
          EmployeePayslip.FileInputChange.setContent($target, $element);

          expect($target.data('content')).to.equal('foo');
        });
      });

      describe('files failure', function () {
        describe('when files do not exist', function () {
          it('should keep origin target content', function () {
            $element.files = undefined;
            EmployeePayslip.FileInputChange.setContent($target, $element);

            expect($target.data('content')).to.equal('foo');
          });
        });

        describe('when files are empty', function () {
          it('should keep origin target content', function () {
            $element.files = {};
            EmployeePayslip.FileInputChange.setContent($target, $element);

            expect($target.data('content')).to.equal('foo');
          });
        });

        describe('when file name is not a string', function () {
          it('should keep origin target content', function () {
            $element.files[0].name = undefined;
            EmployeePayslip.FileInputChange.setContent($target, $element);

            expect($target.data('content')).to.equal('foo');
          });
        });
      });
    });
  });

  describe('onChange', function () {
    var $element, event;

    beforeEach(function () {
      fixture.set('<span id="custom-text" data-content="Choose File"></span>');
      $element = $('<div data-target="#custom-text"></div>');
      event = {target: $element};
      sinon.spy(EmployeePayslip.FileInputChange, 'setContent');
    });

    afterEach(function () {
      EmployeePayslip.FileInputChange.setContent.restore();
    });

    it('should set target content', function () {
      EmployeePayslip.FileInputChange.onChange(event);

      expect(EmployeePayslip.FileInputChange.setContent.calledOnce).to.equal(true);
    });
  });
});
