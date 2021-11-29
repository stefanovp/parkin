import 'package:platform_channel_events/database/fields/ticket_fields.dart';
import 'package:platform_channel_events/models/ticket.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TicketsDatabase {
  static final TicketsDatabase instance = TicketsDatabase._init();

  static Database? _database;

  TicketsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('tickets.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final intType = 'INTEGER';

    await db.execute('''
CREATE TABLE tickets ( 
  ${TicketFields.id} $idType, 
  ${TicketFields.parkingName} $textType,
  ${TicketFields.vehiclePlate} $textType,
  ${TicketFields.cost} $intType,
  ${TicketFields.isPaid} $intType,
  ${TicketFields.isValid} $intType,
  ${TicketFields.expirationDate} $intType
  )
''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<Ticket> create(Ticket ticket) async {
    final db = await instance.database;

    final id = await db.insert('tickets', ticket.toJson());
    return ticket.copyWith(id: id);
  }

  Future<Ticket> readTicket(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      'tickets',
      columns: TicketFields.values,
      where: '${TicketFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Ticket.fromJson(maps.first);
    } else {
      throw Exception('Id not found');
    }
  }

  Future<List<Ticket>> readAllTickets() async {
    final db = await instance.database;

    final result = await db.query('tickets');

    return result.map((json) => Ticket.fromJson(json)).toList();
  }
}
