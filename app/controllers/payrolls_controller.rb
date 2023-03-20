class PayrollsController < ApplicationController
    
    before_action :set_users
  
    def index
      @payrolls = Payroll.all
  
      
    end
  
    def show
      @payroll = Payroll.find(params[:id])
    end
  
    def new
      @payroll = Payroll.new
    end
  
    def create
      @payroll = Payroll.new(payroll_params)
  
      if @payroll.save
        flash[:notice] = "The Paystub was successfully created."
        redirect_to @payroll
      else
        flash[:alert] = "Paystub was NOT created."
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
      @payroll = Payroll.find(params[:id])
    end
  
    def update
      @payroll = Payroll.find(params[:id])
  
      if @payroll.update(payroll_params)
        redirect_to @payroll
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @payroll = Payroll.find(params[:id])
      @payroll.file.purge
      @payroll.destroy
  
      redirect_to root_path, status: :see_other
    end
  
    private
      def payroll_params
        params.require(:payroll).permit(:payroll_date, :user_id, :file)
      end
  
      def set_users
      @users = User.all.order(:firstname)
      
      end
  end