class CalculationsController < ApplicationController
  def addition_form
    render({ :template => "calculation_templates/addition_form.html.erb" })
  end

  def subtraction_form
    render({ :template => "calculation_templates/subtraction_form.html.erb" })
  end

  def multiplication_form
    render({ :template => "calculation_templates/multiplication_form.html.erb" })
  end

  def division_form
    render({ :template => "calculation_templates/division_form.html.erb" })
  end

  def add
    @first_number = params.fetch("first_num").to_f
    @second_number = params.fetch("second_num").to_f

    @result = @first_number.to_f + @second_number.to_f

    cookies.store(:addition_first, @first_number)
    cookies.store(:addition_second, @second_number)
    cookies.store(:addition_result, @result)

    render({ :template => "calculation_templates/add_results.html.erb" })
  end

  def subtract
    @first_number = params.fetch("first_num").to_f
    @second_number = params.fetch("second_num").to_f

    @result =  @second_number.to_f - @first_number.to_f

    cookies.store(:subtraction_first, @first_number)
    cookies.store(:subtraction_second, @second_number)
    cookies.store(:subtraction_result, @result)

    render({ :template => "calculation_templates/subtract_results.html.erb" })
  end

  def multiply
    @first_number = params.fetch("first_num").to_f
    @second_number = params.fetch("second_num").to_f

    @result =  @first_number.to_f * @second_number.to_f

    cookies.store(:multiplication_first, @first_number)
    cookies.store(:multiplication_second, @second_number)
    cookies.store(:multiplication_result, @result)

    render({ :template => "calculation_templates/multiply_results.html.erb" })
  end

  def divide
    @first_number = params.fetch("first_num").to_f
    @second_number = params.fetch("second_num").to_f

    @result =  @first_number.to_f / @second_number.to_f

    cookies.store(:division_first, @first_number)
    cookies.store(:division_second, @second_number)
    cookies.store(:division_result, @result)

    render({ :template => "calculation_templates/divide_results.html.erb" })
  end
end
