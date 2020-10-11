part of 'ticket_bloc.dart';

abstract class TicketEvent extends Equatable {
  const TicketEvent();

  @override
  List<Object> get props => [];
}

class GetTickets extends TicketEvent {
  final String userID;

  GetTickets(this.userID);

  @override
  List<Object> get props => [userID];
}

class BuyTicket extends TicketEvent {
  final String userID;
  final Ticket ticket;

  BuyTicket(this.ticket, this.userID);

  @override
  List<Object> get props => [ticket, userID];
}
