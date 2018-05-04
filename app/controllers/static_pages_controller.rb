class StaticPagesController < ApplicationController

  def home; end
  def program_intro_to_web
    @my_course = MyCourse.new(status: 0)
  end
  def program_modern_javascript; end
  def program_es6
    @my_course = MyCourse.new(status: 0)
  end
  def program_js_camp
    @my_course = MyCourse.new(status: 0)
  end
  def mentors; end
  def faq; end
  def contacts; end
  def offer; end
  def posts; end
  def post1; end
  def corporate; end
  def instructor; end
  def partner; end

end
