class StudentsController < ApplicationController
  before_filter :authenticate_user!
  # GET /students
  # GET /students.json
  def index
    @students = Student.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])
    @notes = @student.notes
      
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new
    @student = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end
    
    
    
  #for bulk imports
  #http://www.funonrails.com/2012/01/csv-file-importexport-in-rails-3.html
    
  def import
      require 'csv'
      if request.post? && params[:file].present?
          infile = params[:file].read
          n, errs = 0, []
          CSV.parse(infile) do |row| n += 1
        # SKIP: header i.e. first row OR blank row
          next if n == 1 or row.join.blank?
        # build_from_csv method will map customer attributes &
        # build new customer record
          student = Student.build_from_csv(row)
        # Save upon valid
        # otherwise collect error records to export
          if student.valid?
              student.save
          else
              errs << row
          end
      end
          
        # Export Error file for later upload upon correction
      if errs.any?
          errFile ="errors_#{Date.today.strftime('%d%b%y')}.csv"
          errs.insert(0, Student.csv_header)
          errCSV = CSV.generate do |csv|
              errs.each {|row| csv << row}
          end
          send_data errCSV,
            :type => 'text/csv; charset=iso-8859-1; header=present',
            :disposition => "attachment; filename=#{errFile}.csv"
      else
            flash[:notice] = I18n.t('Student import success')
          redirect_to :action => "index"
      end
      end
    end
end
