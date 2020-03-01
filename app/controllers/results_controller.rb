class ResultsController < ApplicationController
  def show
    @results = Form.all
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
            "投稿日時","フリガナ","お名前","郵便番号","住所","電話番号","メールアドレス", "ベイクドチーズケーキ","チーズケーキ（3個入り）", "チーズケーキ(6個入り)", "その他","購入したか", "満足度","その他ご意見", "カタログが必要か"]
        @results.each do |result|
          sheet.add_row [result.created_at,result.furigana,result.name,result.postnumber,result.address,result.mail,result.bake,result.cheese3,result.cheese6,result.other,result.isbought,result.satisfied,result.catalog]
        end
      end
      send_data(p.to_stream.read,
                type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                filename: "kazamidori.xlsx")
    end
  end
end
