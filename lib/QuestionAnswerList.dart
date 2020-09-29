import 'QuestionsAnswers.dart';
class QuestionAnswerList{
  static List <QuestionsAnswers> qA=[QuestionsAnswers("What is dengue?","a viral disease transmitted by mosquitoes."),
    QuestionsAnswers("Where can I see Campus cases?","Visit Hotspot Map Page."),
    QuestionsAnswers("Will a campus case alert me?","Alert is sent to students of same hall cluster."),
    QuestionsAnswers("What precautions can I take?","Wear mosquito Repellant."),
    QuestionsAnswers("What to do if I feel sick, and have fever?", "Book an appointment at Fullerton, NTU"),
    QuestionsAnswers("Is drinking water important if I'm sick?","Drink lots of water to stay hydrated."),


  ];
  static List getList()
  {
    return qA;
  }

}
