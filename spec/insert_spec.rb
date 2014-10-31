describe "Inserting data" do
  before do
    @db = SQLite3::Database.new(':memory:')
    @sql_runner = SQLRunner.new(@db)
    @sql_runner.execute_sql_create
    @sql_runner.execute_sql_insert
  end

  it 'has 4 cats' do 
    expect(@db.execute("SELECT COUNT(*) FROM cats;").flatten[0]).to eq(16)
  end
end