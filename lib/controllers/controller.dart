import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:sasha_app/models/model.dart';

class HomeController extends GetxController {
  final countDownControllerStart = CountDownController();
  final countDownControllerPause = CountDownController();
  final countDownControllerCount = CountDownController();
  DateTime now = DateTime.now();
  static AudioPlayer player = new AudioPlayer();
  final box = GetStorage();
  late String formattedDate;

  final Uri _url = Uri.parse("https://www.paypal.com");
  List<PlanModel> _planModel = [];
  List calenderList = <PlanModel>[].obs;

  var isStartTimeOver = false.obs;
  var start = 600.obs;
  var pause = 30.obs;
  var errorText = "".obs;
  var autoplay = false.obs;

  @override
  void onInit() {
    formattedDate = DateFormat('dd.MM.yyy hh:mm').format(now);
    restoreTasks();
    super.onInit();
  }

  Future<void> startFunction() async {
    pause.value = 0;
    isStartTimeOver.value = false;
    countDownControllerStart.start();
    update();
  }

  Future<void> onCompletedFunction() async {
    player.play(AssetSource("sounds/end.wav"), volume: 100);

    if (start.value == 600) {
      final task = PlanModel(start: start.value, dateTime: formattedDate);

      addEndStorageTask(task);

      isStartTimeOver.value = true;
      countDownControllerPause.start();
      autoplay.value = true;
    } else {
      pause.value = 0;
      isStartTimeOver.value = false;
      autoplay.value = false;
    }
    update();
  }

  Future<void> addEndStorageTask(PlanModel planModel) async {
    _planModel.add(planModel);
    calenderList.add(planModel.toMap()); // adding temp map to storageList
    box.write('tasks', calenderList);

    // adding list of maps to storage
    update();
  }

  Future<void> restoreTasks() async {
    calenderList =
        await box.read('tasks') ?? []; // initializing list from storage

    // looping through the storage list to parse out Task objects from maps
    for (final map in calenderList) {
      _planModel.add(
          PlanModel.fromMap(map)); // adding Tasks back to your normal Task list
    }
    print("THE FKUNG TASK....${calenderList}");
    update();
  }

  // looping through your list to see whats inside
  void printTasks() {
    for (final task in _planModel) {
      print("THE FKUNG TASK....${task.toString()}");
    }
  }

  Future<void> onCompletedPauseFunction() async {
    player.play(AssetSource("sounds/start.wav"), volume: 100);
    if (pause.value == 2) {
      isStartTimeOver.value = false;
    } else {
      pause.value == 0;
      isStartTimeOver.value = true;
    }
    update();
  }

  void showPauseNotification() {}

  Future launchUrl(Uri url) async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
