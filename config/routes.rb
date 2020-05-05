Rails.application.routes.draw do
  get("/muggle_translate", { :controller => "translations", :action => "translation_form" })
  get("/wizard_translate", { :controller => "translations", :action => "translate" })

  get("/muggle_add", { :controller => "calculations", :action => "addition_form" })
  get("/wizard_add", { :controller => "calculations", :action => "add" })

  get("/muggle_subtract", { :controller => "calculations", :action => "subtraction_form" })
  get("/wizard_subtract", { :controller => "calculations", :action => "subtract" })

  get("/muggle_multiply", { :controller => "calculations", :action => "multiplication_form" })
  get("/wizard_multiply", { :controller => "calculations", :action => "multiply" })

  get("/muggle_divide", { :controller => "calculations", :action => "division_form" })
  get("/wizard_divide", { :controller => "calculations", :action => "divide" })

  get("/", { :controller => "calculations", :action => "addition_form" })
end
