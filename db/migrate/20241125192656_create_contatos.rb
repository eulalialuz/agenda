class CreateContatos < ActiveRecord::Migration[8.0]
  def change
    create_table :contatos do |t|
      t.string :nome
      t.string :telefone
      t.string :email

      t.timestamps
    end
  end
end
