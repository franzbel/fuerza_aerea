# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

helicopter1 = Helicopter.find_by_plate_number('FAB 001')
  tail_rotor_drive = System.create( :ata_100 => 65, :title => 'TAIL ROTOR DRIVE', :helicopter_id => helicopter1.id )
    intermediate_gearbox = Component.create( :name => 'Intermediate Gearbox', :system_id => tail_rotor_drive.id )
      Part.create( :part_number => '4639 002 007', :component_id => intermediate_gearbox.id )
      Part.create( :part_number => '4639 002 009', :component_id => intermediate_gearbox.id )
      Part.create( :part_number => '4639 002 012', :component_id => intermediate_gearbox.id )
      Tbo.create(:initial_value => 1500, :unit => 'Fh', :component_id => intermediate_gearbox.id )


    tail_rotor_transmission = Component.create( :name => 'Tail Rotor Transmission', :system_id => tail_rotor_drive.id )
      Part.create( :part_number => '4639 003 009', :component_id => tail_rotor_transmission.id )
      Part.create( :part_number => '4639 003 011', :component_id => tail_rotor_transmission.id )
      Part.create( :part_number => '4639 004 013', :component_id => tail_rotor_transmission.id )
      Tbo.create(:initial_value => 1800, :unit => 'Fh', :component_id => tail_rotor_transmission.id )

  main_rotor_drive = System.create( :ata_100 => 63, :title => 'MAIN ROTOR DRIVE', :helicopter_id => helicopter1.id )
    main_transmission_brake = Component.create( :name => 'Main Transmission with brake disk', :system_id => main_rotor_drive.id )
      Part.create( :part_number => 'B632M2001102', :component_id => main_transmission_brake.id )
      Tbo.create(:initial_value => 4300, :unit => 'Fh', :component_id => main_transmission_brake.id )
    main_transmission = Component.create( :name => 'Main Transmission', :system_id => main_rotor_drive.id )
      Part.create( :part_number => 'B632K1001-051', :component_id => main_transmission.id )
      Tbo.create(:initial_value => 4300, :unit => 'Fh', :component_id => main_transmission.id )



helicopter2 = Helicopter.find_by_plate_number('FAB 002')
  tail_rotor_drive = System.create( :ata_100 => 65, :title => 'TAIL ROTOR DRIVE', :helicopter_id => helicopter2.id )
    intermediate_gearbox = Component.create( :name => 'Intermediate Gearbox', :system_id => tail_rotor_drive.id )
      Part.create( :part_number => '4639 002 007', :component_id => intermediate_gearbox.id )
      Part.create( :part_number => '4639 002 009', :component_id => intermediate_gearbox.id )
      Part.create( :part_number => '4639 002 012', :component_id => intermediate_gearbox.id )
      Tbo.create(:initial_value => 1500, :unit => 'Fh', :component_id => intermediate_gearbox.id )


    tail_rotor_transmission = Component.create( :name => 'Tail Rotor Transmission', :system_id => tail_rotor_drive.id )
      Part.create( :part_number => '4639 003 009', :component_id => tail_rotor_transmission.id )
      Part.create( :part_number => '4639 003 011', :component_id => tail_rotor_transmission.id )
      Part.create( :part_number => '4639 004 013', :component_id => tail_rotor_transmission.id )
      Tbo.create(:initial_value => 1800, :unit => 'Fh', :component_id => tail_rotor_transmission.id )

  main_rotor_drive = System.create( :ata_100 => 63, :title => 'MAIN ROTOR DRIVE', :helicopter_id => helicopter2.id )
    main_transmission_brake = Component.create( :name => 'Main Transmission with brake disk', :system_id => main_rotor_drive.id )
      Part.create( :part_number => 'B632M2001102', :component_id => main_transmission_brake.id )
      Tbo.create(:initial_value => 4300, :unit => 'Fh', :component_id => main_transmission_brake.id )
    main_transmission = Component.create( :name => 'Main Transmission', :system_id => main_rotor_drive.id )
      Part.create( :part_number => 'B632K1001-051', :component_id => main_transmission.id )
      Tbo.create(:initial_value => 4300, :unit => 'Fh', :component_id => main_transmission.id )
