class FormsController < ApplicationController
  def index
    @forms = Form.new
    
  end

  def create
    @forms = Form.new(form_params)
    if @forms.save
      redirect_to form_path(@forms) and return
    end
  end

  def show
    @forms = Form.all
    respond_to do |format|
      format.html
      format.xlsx do
        generate_xlsx
      end
    end
  end

  private
  def form_params
    params.require(:form).permit(
      :name, 
      :item, 
      :isbought, 
      :other, 
      :catalog, 
      :furigana, 
      :gender, 
      :age, 
      :postnumber, 
      :address, 
      :tel, 
      :mail,
      :bake,
      :cheese3,
      :cheese6,
      :satisfied
      )
  end

  def generate_xlsx
    Axlsx::Package.new do |p|
        p.workbook.add_worksheet(name: "bbb") do |sheet|
          styles = p.workbook.styles
          title = styles.add_style(bg_color: 'c0c0c0', b: true)
          header = styles.add_style(bg_color: 'e0e0e0', b: true)

          sheet.add_row [
            "商品名","購入したか","その他意見","カタログ必要か"]
        @forms.each do |result|
          sheet.add_row [result.item,result.isbought,result.other,result.catalog]
        end
      end
      send_data(p.to_stream.read,
                type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                filename: "kazamidori.xlsx")
    end
  end
end
