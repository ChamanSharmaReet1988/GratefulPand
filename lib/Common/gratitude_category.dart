class GratitudeCategory {
  final String categoryName;
  final String emoji;
  final List<Map<String, String>> items;

  GratitudeCategory({
    required this.categoryName,
    required this.emoji,
    required this.items,
  });
}
List<GratitudeCategory> gratitudeCategories = [
  GratitudeCategory(
    categoryName: "Self",
    emoji: "🌿",
    items: [
  {
    "anchor": "You’ve been with yourself through everything.",
    "prompt": "Remember one quality, habit, or small choice that helped you keep going.",
    "example": "staying patient, showing up even when tired, forgiving yourself, starting again.",
    "gratitude_example": "I'm grateful for my persistence — even on days I wanted to stop, I kept showing up.",
    "pause_cue": "Take a moment to notice the strength that’s already in you.",
    "placeholder": "Write a quiet thank-you to yourself — even one line is enough."
  },
  {
    "anchor": "You are your own safe place.",
    "prompt": "Think of a time you comforted or encouraged yourself when no one else could.",
    "example": "calming your thoughts, taking a walk, finding kind words for yourself.",
    "gratitude_example": "I'm grateful that I know how to soothe myself when life feels heavy.",
    "pause_cue": "Let that memory remind you of your ability to care for yourself.",
    "placeholder": "Write a few words of gratitude for how you showed up for yourself."
  },
  {
    "anchor": "Your small efforts are acts of love.",
    "prompt": "Recall one everyday thing you did that quietly made your life easier.",
    "example": "preparing a meal, cleaning your space, sticking to a small routine.",
    "gratitude_example": "I'm grateful for the simple care I give myself by staying organized and nourished.",
    "pause_cue": "Notice how even simple care holds meaning.",
    "placeholder": "Write your thank-you for that small effort."
  },
  {
    "anchor": "You’re allowed to rest and still be worthy.",
    "prompt": "Think of a moment you gave yourself permission to slow down.",
    "example": "turning off your phone, taking a nap, saying no kindly.",
    "gratitude_example": "I'm grateful for the peace I give myself when I allow rest without guilt.",
    "pause_cue": "Let that calm remind you that rest is productive too.",
    "placeholder": "Write what you’re grateful for about giving yourself rest."
  },
  {
    "anchor": "Growth often hides in quiet changes.",
    "prompt": "Recall a way you’ve changed for the better, even slightly.",
    "example": "reacting with patience, setting boundaries, letting go of overthinking.",
    "gratitude_example": "I'm grateful for how I've learned to pause before reacting — it’s made life gentler.",
    "pause_cue": "Feel appreciation for the person you’re becoming.",
    "placeholder": "Write one line of gratitude for your own growth."
  },
  {
    "anchor": "Your body is part of your story.",
    "prompt": "Notice something your body allowed you to experience or enjoy.",
    "example": "walking freely, breathing deeply, dancing, resting peacefully.",
    "gratitude_example": "I'm grateful for my body’s quiet strength that carries me through each day.",
    "pause_cue": "Acknowledge how your body supports you daily.",
    "placeholder": "Write a thank-you to your body for carrying you."
  },
  {
    "anchor": "You’ve kept promises that no one saw.",
    "prompt": "Think of something responsible or caring you did that went unnoticed.",
    "example": "staying consistent, being patient, paying attention to detail.",
    "gratitude_example": "I'm grateful for the reliability I bring to my life, even when no one’s watching.",
    "pause_cue": "Let yourself feel proud without needing applause.",
    "placeholder": "Write appreciation for that unseen reliability."
  },
  {
    "anchor": "Courage can look like softness.",
    "prompt": "Remember a moment you chose gentleness over reaction.",
    "example": "forgiving, listening, staying calm, walking away from conflict.",
    "gratitude_example": "I'm grateful that I can choose calm and kindness even when I’m hurt.",
    "pause_cue": "Feel gratitude for the strength behind your calm.",
    "placeholder": "Write a short thank-you for your gentle courage."
  },
  {
    "anchor": "You are learning to trust yourself.",
    "prompt": "Think of a decision that felt right because it came from intuition.",
    "example": "following your curiosity, saying no, making a brave change.",
    "gratitude_example": "I'm grateful for trusting my intuition — it’s led me toward peace.",
    "pause_cue": "Honor that inner voice that guided you.",
    "placeholder": "Write your appreciation for trusting yourself."
  },
  {
    "anchor": "Every version of you tried its best.",
    "prompt": "Recall an old version of yourself that helped you reach this point.",
    "example": "the one who worked hard, the one who believed, the one who kept going.",
    "gratitude_example": "I'm grateful for every past version of me that didn’t give up.",
    "pause_cue": "Thank that version for carrying you until now.",
    "placeholder": "Write a note of gratitude to your past self."
  },
  {
    "anchor": "You’ve forgiven parts of yourself quietly.",
    "prompt": "Remember something you once blamed yourself for but have softened toward.",
    "example": "a mistake, a delay, a choice you now understand differently.",
    "gratitude_example": "I'm grateful that I can now look at old mistakes with understanding, not shame.",
    "pause_cue": "Feel the relief that comes with self-forgiveness.",
    "placeholder": "Write what you’re grateful to have forgiven within yourself."
  },
  {
    "anchor": "You’re becoming who you once needed.",
    "prompt": "Think of a quality you now embody that younger you longed for.",
    "example": "confidence, calm, independence, self-respect.",
    "gratitude_example": "I'm grateful that I’ve grown into someone my younger self would look up to.",
    "pause_cue": "Smile at how you’ve grown into your own support.",
    "placeholder": "Write a line of gratitude for who you’ve become."
  },
  {
    "anchor": "Even trying counts.",
    "prompt": "Recall a time you showed up imperfectly but still gave your effort.",
    "example": "doing your best despite stress, keeping a promise, staying kind while tired.",
    "gratitude_example": "I'm grateful that I keep trying, even when progress feels slow.",
    "pause_cue": "Let appreciation replace judgment.",
    "placeholder": "Write what you’re grateful for about simply trying."
  },
  {
    "anchor": "You find beauty in small routines.",
    "prompt": "Think of a daily habit that steadies or comforts you.",
    "example": "morning coffee, journaling, evening walks.",
    "gratitude_example": "I'm grateful for the rituals that make my days feel anchored.",
    "pause_cue": "Notice how repetition builds peace.",
    "placeholder": "Write gratitude for that small routine that grounds you."
  },
  {
    "anchor": "Self-respect is quiet gratitude in action.",
    "prompt": "Recall a boundary that protected your peace.",
    "example": "saying no, leaving on time, prioritizing your health.",
    "gratitude_example": "I'm grateful for the strength it takes to protect my energy with kindness.",
    "pause_cue": "Feel thankful for honoring your needs.",
    "placeholder": "Write what you appreciate about keeping that boundary."
  },
  {
    "anchor": "Your kindness toward yourself is practice, not perfection.",
    "prompt": "Think of one moment you spoke gently to yourself instead of with criticism.",
    "example": "forgiving a delay, appreciating effort, letting yourself rest.",
    "gratitude_example": "I'm grateful for the patience I show myself as I keep learning.",
    "pause_cue": "Let warmth replace judgment for a second.",
    "placeholder": "Write a short thank-you for your own compassion."
  },
  {
    "anchor": "Stillness also moves you forward.",
    "prompt": "Remember a time you paused before reacting and it changed everything.",
    "example": "choosing silence, taking a breath, waiting overnight before replying.",
    "gratitude_example": "I'm grateful for the wisdom I find in stillness.",
    "pause_cue": "Be grateful for the wisdom that lives in stillness.",
    "placeholder": "Write gratitude for that calm decision."
  },
  {
    "anchor": "You’ve learned to begin again.",
    "prompt": "Think of something you restarted after stopping for a while.",
    "example": "exercising, journaling, reconnecting with someone, dreaming again.",
    "gratitude_example": "I'm grateful for my ability to start over without fear.",
    "pause_cue": "Appreciate your capacity to return without shame.",
    "placeholder": "Write what you’re grateful for about starting again."
  },
  {
    "anchor": "Your self-talk shapes your world.",
    "prompt": "Recall a phrase or reminder that helps you stay kind to yourself.",
    "example": "'I’ve done enough', 'I can handle this', 'One step at a time'.",
    "gratitude_example": "I'm grateful for the words that calm me when I begin to doubt myself.",
    "pause_cue": "Whisper it once and feel its truth.",
    "placeholder": "Write your gratitude for that thought that steadies you."
  },
  {
    "anchor": "Progress is quieter than people think.",
    "prompt": "Think of something you now do naturally that once took effort.",
    "example": "saying no, speaking kindly to yourself, staying consistent.",
    "gratitude_example": "I'm grateful for the quiet progress I’ve made that others may not see.",
    "pause_cue": "Let pride and peace sit together for a moment.",
    "placeholder": "Write one line of gratitude for that quiet progress."
  },
  {
    "anchor": "You keep finding your balance.",
    "prompt": "Remember a day when you adjusted gracefully instead of giving up.",
    "example": "adapting to change, staying calm in chaos, trying again differently.",
    "gratitude_example": "I'm grateful for the balance I keep finding in uncertain times.",
    "pause_cue": "Thank yourself for choosing balance over control.",
    "placeholder": "Write gratitude for your adaptability."
  },
  {
    "anchor": "You’ve learned to enjoy your own company.",
    "prompt": "Think of a moment alone that felt peaceful, not lonely.",
    "example": "reading quietly, walking solo, enjoying your own silence.",
    "gratitude_example": "I'm grateful that I can find comfort and peace in my own presence.",
    "pause_cue": "Notice the comfort in your own presence.",
    "placeholder": "Write what you appreciate about being with yourself."
  },
  {
    "anchor": "You’ve turned lessons into wisdom.",
    "prompt": "Recall something difficult that later made sense or brought peace.",
    "example": "losing something, outgrowing someone, waiting longer than planned.",
    "gratitude_example": "I'm grateful for how time has turned old pain into clarity.",
    "pause_cue": "Feel gratitude for the understanding time gave you.",
    "placeholder": "Write your thank-you for the lesson behind the pain."
  },
  {
    "anchor": "You know how to find light in ordinary moments.",
    "prompt": "Think of a small pleasure that reminds you life doesn’t need to be perfect to feel good.",
    "example": "morning light, a good meal, music you love, clean sheets.",
    "gratitude_example": "I'm grateful for the everyday joys that remind me I already have enough.",
    "pause_cue": "Let a soft smile appear — that’s gratitude arriving.",
    "placeholder": "Write what you’re thankful for in that simple joy."
  },
  {
    "anchor": "You are enough, even while changing.",
    "prompt": "Remember that you’re worthy not because of what you achieve but because you exist.",
    "example": "being loved, showing kindness, existing with sincerity.",
    "gratitude_example": "I'm grateful that I can rest in the truth that I am already enough.",
    "pause_cue": "Breathe and let enoughness settle in.",
    "placeholder": "Write a line of gratitude for simply being you."
  }
],
  ),
  
  GratitudeCategory(
    categoryName: "Friends",
    emoji: "💞",
    items: [
  {
    "anchor": "Some people make life softer.",
    "prompt": "Think of a friend whose presence brings ease or laughter.",
    "example": "someone you can be yourself around, someone who makes you laugh effortlessly.",
    "gratitude_example": "I'm grateful for the friends who make ordinary days feel lighter.",
    "pause_cue": "Let their face or voice come to mind for a moment.",
    "placeholder": "Write what you appreciate about that friendship."
  },
  {
    "anchor": "Friendship is love spoken casually.",
    "prompt": "Recall a small gesture from a friend that made you feel seen.",
    "example": "a quick message, remembering something about you, showing up unexpectedly.",
    "gratitude_example": "I'm grateful for friends who notice the little things that matter to me.",
    "pause_cue": "Feel the warmth of being remembered.",
    "placeholder": "Write one line of thanks for that simple act of care."
  },
  {
    "anchor": "Shared laughter heals quietly.",
    "prompt": "Think of a moment you couldn’t stop laughing with a friend.",
    "example": "an inside joke, a funny story, something ridiculous you both understood.",
    "gratitude_example": "I'm grateful for the laughter that reminds me how good it feels to be understood.",
    "pause_cue": "Let that memory soften your face into a smile.",
    "placeholder": "Write what you’re thankful for about that shared joy."
  },
  {
    "anchor": "True friends hold space for silence.",
    "prompt": "Remember a moment when you sat with a friend in quiet comfort.",
    "example": "walking together, watching something, sharing a meal without words.",
    "gratitude_example": "I'm grateful for friends with whom silence still feels full.",
    "pause_cue": "Notice the peace that lives in wordless connection.",
    "placeholder": "Write what you appreciate about feeling safe in silence."
  },
  {
    "anchor": "They see you through every season.",
    "prompt": "Think of a friend who’s been there across changes in your life.",
    "example": "childhood friend, old coworker, someone who stayed despite distance.",
    "gratitude_example": "I'm grateful for friends who’ve known every version of me and stayed.",
    "pause_cue": "Let that sense of loyalty fill your heart.",
    "placeholder": "Write a thank-you for their steady presence."
  },
  {
    "anchor": "Friendship is made of small kindnesses.",
    "prompt": "Recall a friend who helped when you didn’t even ask.",
    "example": "bringing you food, listening late, offering support.",
    "gratitude_example": "I'm grateful for the kindness my friends offer without expecting anything in return.",
    "pause_cue": "Let gratitude flow for how cared-for you truly are.",
    "placeholder": "Write what act of kindness you’re thankful for."
  },
  {
    "anchor": "Distance doesn’t dull connection.",
    "prompt": "Think of a friend you may not see often but still feel close to.",
    "example": "someone who checks in occasionally, yet always feels near.",
    "gratitude_example": "I'm grateful that real friendship doesn’t fade with time or distance.",
    "pause_cue": "Feel the invisible thread that keeps you connected.",
    "placeholder": "Write a line of thanks for that lasting bond."
  },
  {
    "anchor": "Good friends tell you the truth kindly.",
    "prompt": "Recall a time a friend gave you honest advice that helped.",
    "example": "gently pointing out something you couldn’t see, reminding you of your worth.",
    "gratitude_example": "I'm grateful for the friends who speak truth with love, not judgment.",
    "pause_cue": "Let appreciation grow for the honesty that helps you grow.",
    "placeholder": "Write what you value about their honesty."
  },
  {
    "anchor": "Friendship means growing together, not apart.",
    "prompt": "Think of a friend whose growth inspires your own.",
    "example": "someone chasing dreams, healing, changing for the better.",
    "gratitude_example": "I'm grateful for friends who remind me to keep becoming.",
    "pause_cue": "Smile at how growth can be shared.",
    "placeholder": "Write a short thank-you for their inspiration."
  },
  {
    "anchor": "Old friends are anchors in time.",
    "prompt": "Remember someone who’s known you the longest.",
    "example": "childhood friend, someone who remembers your stories from years ago.",
    "gratitude_example": "I'm grateful for the friends who remind me of who I’ve always been.",
    "pause_cue": "Let nostalgia feel gentle, not heavy.",
    "placeholder": "Write gratitude for the memories you share."
  },
  {
    "anchor": "New friends bring new light.",
    "prompt": "Think of a new friendship that feels refreshing or inspiring.",
    "example": "someone you met recently who just ‘gets’ you.",
    "gratitude_example": "I'm grateful for new connections that feel instantly safe.",
    "pause_cue": "Let yourself appreciate the ease of that beginning.",
    "placeholder": "Write what you’re thankful for about meeting them."
  },
  {
    "anchor": "Friendship deepens through shared honesty.",
    "prompt": "Recall a real conversation that made your bond stronger.",
    "example": "opening up about fears, sharing dreams, being vulnerable together.",
    "gratitude_example": "I'm grateful for the friends who hold my truths with care.",
    "pause_cue": "Feel the trust that honesty builds.",
    "placeholder": "Write what you appreciate about their openness."
  },
  {
    "anchor": "Friends remind you who you are.",
    "prompt": "Think of someone who reminded you of your worth when you forgot.",
    "example": "encouraging words, gentle reminders, believing in you.",
    "gratitude_example": "I'm grateful for the people who see my light even when I can’t.",
    "pause_cue": "Let that memory remind you that you matter.",
    "placeholder": "Write a few words of thanks for their faith in you."
  },
  {
    "anchor": "Good friends are chosen family.",
    "prompt": "Recall someone who feels like home even without blood ties.",
    "example": "a best friend, roommate, or someone who’s seen your highs and lows.",
    "gratitude_example": "I'm grateful for the friends who’ve become my family.",
    "pause_cue": "Feel the comfort of that chosen closeness.",
    "placeholder": "Write what makes that friendship feel like home."
  },
  {
    "anchor": "Sometimes support is just presence.",
    "prompt": "Think of a friend who was simply there when you needed company.",
    "example": "staying with you quietly, checking in, offering no advice — just care.",
    "gratitude_example": "I'm grateful for friends who stay close when words aren’t enough.",
    "pause_cue": "Notice how presence can feel like love.",
    "placeholder": "Write a note of gratitude for their quiet support."
  },
  {
    "anchor": "They celebrate your wins like their own.",
    "prompt": "Remember a friend who was genuinely happy for you.",
    "example": "cheering your success, sharing your joy, encouraging you forward.",
    "gratitude_example": "I'm grateful for friends who celebrate me without comparison.",
    "pause_cue": "Let their joy for you remind you that you’re supported.",
    "placeholder": "Write what you appreciate about their celebration."
  },
  {
    "anchor": "Friendship can outlast misunderstanding.",
    "prompt": "Think of a friend you reconnected with after distance or conflict.",
    "example": "apologizing, reaching out again, letting things soften naturally.",
    "gratitude_example": "I'm grateful for friendships that bend but don’t break.",
    "pause_cue": "Let that relief settle in your heart.",
    "placeholder": "Write gratitude for the forgiveness between you."
  },
  {
    "anchor": "Friends teach you about yourself.",
    "prompt": "Recall a lesson or realization that came from a friendship.",
    "example": "learning patience, empathy, how to communicate better.",
    "gratitude_example": "I'm grateful for the lessons my friendships have taught me about love and boundaries.",
    "pause_cue": "Appreciate the growth that friendship brings.",
    "placeholder": "Write a thank-you for what that friend helped you learn."
  },
  {
    "anchor": "A true friend remembers your heart.",
    "prompt": "Think of someone who understands your moods or needs without words.",
    "example": "checking in, bringing comfort, finishing your sentences.",
    "gratitude_example": "I'm grateful for the friends who just know what I need.",
    "pause_cue": "Smile at how being known feels like peace.",
    "placeholder": "Write what you’re grateful for about their understanding."
  },
  {
    "anchor": "Friendship grows through giving and receiving.",
    "prompt": "Remember a time you showed up for a friend or they for you.",
    "example": "helping with a move, listening, sharing advice, lending time.",
    "gratitude_example": "I'm grateful for the balance of care that keeps friendships alive.",
    "pause_cue": "Feel thankful for that exchange of kindness.",
    "placeholder": "Write a few words about that shared support."
  },
  {
    "anchor": "Friends make memories out of ordinary days.",
    "prompt": "Think of a simple moment that became special because of who you were with.",
    "example": "late-night talks, coffee runs, doing nothing together.",
    "gratitude_example": "I'm grateful for the ordinary days my friends turn into stories.",
    "pause_cue": "Let that memory bring back warmth.",
    "placeholder": "Write gratitude for that moment together."
  },
  {
    "anchor": "Real friends make you feel lighter, not smaller.",
    "prompt": "Recall someone whose presence makes you feel accepted and enough.",
    "example": "no need to impress, no pressure, just peace.",
    "gratitude_example": "I'm grateful for friends who make me feel safe being myself.",
    "pause_cue": "Notice the comfort that comes from acceptance.",
    "placeholder": "Write what you appreciate about feeling seen as you are."
  },
  {
    "anchor": "Friends remind you to play again.",
    "prompt": "Think of a fun or spontaneous thing you did together.",
    "example": "dancing, laughing, exploring somewhere new.",
    "gratitude_example": "I'm grateful for friends who bring back my playful side.",
    "pause_cue": "Let joy rise without reason.",
    "placeholder": "Write a thank-you for that shared fun."
  },
  {
    "anchor": "Even when apart, friendship endures.",
    "prompt": "Recall someone you miss but still feel connected to.",
    "example": "old school friend, someone who moved away, a bond that still feels strong.",
    "gratitude_example": "I'm grateful for friendships that time cannot fade.",
    "pause_cue": "Let nostalgia feel tender, not sad.",
    "placeholder": "Write gratitude for that lasting connection."
  },
  {
    "anchor": "Friends are mirrors of our kindness.",
    "prompt": "Think of how your love and care reflect back through your friends.",
    "example": "the way they listen, laugh, or support you like you do for them.",
    "gratitude_example": "I'm grateful for friendships that reflect the love I give out.",
    "pause_cue": "Feel balance in the mutual care you share.",
    "placeholder": "Write a note of thanks for that reflection of kindness."
  },
  {
    "anchor": "Every friendship leaves a trace of light.",
    "prompt": "Think of a friend who shaped you, even if you’re not close now.",
    "example": "someone who influenced your path, helped you grow, or taught a lesson.",
    "gratitude_example": "I'm grateful for every friend who left a bit of light on my journey.",
    "pause_cue": "Honor the meaning even in endings.",
    "placeholder": "Write what you’re thankful for about that chapter."
  }
],
  ),
  
  GratitudeCategory(
    categoryName: "Family",
    emoji: "💞",
    items: [
  {
    "anchor": "Family is the first language of belonging.",
    "prompt": "Think of a family member whose love or care you often take for granted.",
    "example": "a parent who checks in, a sibling who remembers small things, a grandparent’s warmth.",
    "gratitude_example": "I'm grateful for the quiet ways my family shows love, even without words.",
    "pause_cue": "Let that familiar care fill your heart for a moment.",
    "placeholder": "Write what you appreciate about their steady love."
  },
  {
    "anchor": "Home isn’t a place—it’s people.",
    "prompt": "Recall a moment that made you feel at home with your family.",
    "example": "a shared meal, laughter, small traditions, a comfortable silence.",
    "gratitude_example": "I'm grateful for the sense of home my family gives me, no matter where we are.",
    "pause_cue": "Let that warmth expand inside you.",
    "placeholder": "Write gratitude for the people who feel like home."
  },
  {
    "anchor": "Love in families often hides in routine.",
    "prompt": "Think of an everyday gesture that quietly says 'I care.'",
    "example": "making tea, doing chores together, small check-ins.",
    "gratitude_example": "I'm grateful for the simple routines that hold our love together.",
    "pause_cue": "Notice how care can be ordinary and sacred at once.",
    "placeholder": "Write what everyday love looks like in your family."
  },
  {
    "anchor": "Forgiveness keeps families soft.",
    "prompt": "Remember a time someone in your family forgave you—or you forgave them.",
    "example": "an argument that healed, an apology accepted, tension that eased.",
    "gratitude_example": "I'm grateful for forgiveness that allows us to stay close despite mistakes.",
    "pause_cue": "Feel the relief that comes with understanding.",
    "placeholder": "Write what you’re thankful for about that forgiveness."
  },
  {
    "anchor": "Shared memories build invisible bridges.",
    "prompt": "Think of a memory that connects your family across time.",
    "example": "childhood stories, holidays, family jokes, old photos.",
    "gratitude_example": "I'm grateful for the stories that keep us connected even when we’re apart.",
    "pause_cue": "Smile at the memory that still lives in you.",
    "placeholder": "Write a few words about that shared moment."
  },
  {
    "anchor": "Family teaches patience through closeness.",
    "prompt": "Recall a time you learned to understand instead of react.",
    "example": "listening fully, holding space, choosing calm.",
    "gratitude_example": "I'm grateful for how family teaches me to love with patience.",
    "pause_cue": "Let that gentleness sink in.",
    "placeholder": "Write what you appreciate about learning patience."
  },
  {
    "anchor": "Parents love in their own language.",
    "prompt": "Think of something your parents or guardians did that showed care, even if quietly.",
    "example": "providing support, advice, checking your safety, small sacrifices.",
    "gratitude_example": "I'm grateful for the ways my parents show love without needing to say it.",
    "pause_cue": "Feel gratitude for what they’ve given in their own way.",
    "placeholder": "Write what you’re thankful for about their love."
  },
  {
    "anchor": "Siblings hold our shared history.",
    "prompt": "Recall a moment with a sibling or cousin that made you laugh or feel understood.",
    "example": "an inside joke, shared challenge, mutual encouragement.",
    "gratitude_example": "I'm grateful for the siblings who remind me where I come from.",
    "pause_cue": "Let that shared laughter echo inside you.",
    "placeholder": "Write gratitude for that bond."
  },
  {
    "anchor": "Family can mean chosen people too.",
    "prompt": "Think of someone outside your bloodline who feels like family.",
    "example": "a mentor, best friend, neighbor, guardian figure.",
    "gratitude_example": "I'm grateful for the people I’ve chosen who feel like family.",
    "pause_cue": "Notice how love expands beyond lineage.",
    "placeholder": "Write what you appreciate about your chosen family."
  },
  {
    "anchor": "Love is passed down in small habits.",
    "prompt": "Recall a habit or saying you inherited from someone in your family.",
    "example": "a recipe, a phrase, a morning routine.",
    "gratitude_example": "I'm grateful for the traditions that keep my family’s spirit alive in me.",
    "pause_cue": "Feel how legacy continues through you.",
    "placeholder": "Write a thank-you for what they’ve passed on."
  },
  {
    "anchor": "Family love adapts with time.",
    "prompt": "Think of how your relationship with a family member has evolved.",
    "example": "growing closer, understanding their struggles, reconnecting after distance.",
    "gratitude_example": "I'm grateful for how our love keeps changing but never disappears.",
    "pause_cue": "Let that growth feel peaceful.",
    "placeholder": "Write gratitude for how your connection has matured."
  },
  {
    "anchor": "Sometimes love looks like showing up.",
    "prompt": "Recall someone in your family who always shows up when needed.",
    "example": "attending events, checking in, helping in emergencies.",
    "gratitude_example": "I'm grateful for the dependability of my family when it matters most.",
    "pause_cue": "Feel safe in that reliability.",
    "placeholder": "Write what you appreciate about their consistency."
  },
  {
    "anchor": "Family reminds us of where we began.",
    "prompt": "Think of a childhood place or memory that still brings comfort.",
    "example": "your old room, a favorite meal, bedtime stories.",
    "gratitude_example": "I'm grateful for the comfort of remembering where I started.",
    "pause_cue": "Let nostalgia feel gentle and grounding.",
    "placeholder": "Write a few words about that memory."
  },
  {
    "anchor": "Grandparents carry timeless wisdom.",
    "prompt": "Recall something you learned or received from an elder.",
    "example": "a story, advice, warmth, resilience.",
    "gratitude_example": "I'm grateful for the wisdom my grandparents shared through stories and love.",
    "pause_cue": "Feel how wisdom continues in you.",
    "placeholder": "Write what you’re thankful for about their guidance."
  },
  {
    "anchor": "Family love isn’t perfect—it’s persistent.",
    "prompt": "Think of a time your family reconnected after conflict or misunderstanding.",
    "example": "talking again, forgiving, starting over.",
    "gratitude_example": "I'm grateful for the love that endures through imperfection.",
    "pause_cue": "Let appreciation soften old edges.",
    "placeholder": "Write gratitude for the healing that happened."
  },
  {
    "anchor": "They know your story by heart.",
    "prompt": "Think of a relative who remembers things about you no one else does.",
    "example": "favorite foods, childhood quirks, milestones.",
    "gratitude_example": "I'm grateful for those who remember my little details—it feels like being seen.",
    "pause_cue": "Feel the comfort of being remembered.",
    "placeholder": "Write what you appreciate about that closeness."
  },
  {
    "anchor": "Family is found in shared care.",
    "prompt": "Recall a moment when you cared for someone in your family.",
    "example": "helping them heal, listening, standing by them.",
    "gratitude_example": "I'm grateful for the tenderness that flows both ways in my family.",
    "pause_cue": "Let that mutual care warm you.",
    "placeholder": "Write gratitude for the chance to give love back."
  },
  {
    "anchor": "Family ties are woven with humor.",
    "prompt": "Remember a time your family made you laugh uncontrollably.",
    "example": "shared joke, funny mistake, teasing with love.",
    "gratitude_example": "I'm grateful for the laughter that keeps our family light.",
    "pause_cue": "Smile at the joy that still echoes.",
    "placeholder": "Write what you cherish about that laughter."
  },
  {
    "anchor": "You can love family and still need space.",
    "prompt": "Think of a time you honored both love and distance.",
    "example": "setting boundaries, visiting less, protecting your energy.",
    "gratitude_example": "I'm grateful that love can coexist with space and respect.",
    "pause_cue": "Breathe in freedom and care at once.",
    "placeholder": "Write what you appreciate about balanced love."
  },
  {
    "anchor": "Family bonds remind us we’re not alone.",
    "prompt": "Recall a time your family came together for something important.",
    "example": "celebration, loss, change, reunion.",
    "gratitude_example": "I'm grateful for the unity that surfaces when we need each other most.",
    "pause_cue": "Feel that sense of togetherness again.",
    "placeholder": "Write what you’re thankful for about that gathering."
  },
  {
    "anchor": "Family roots, personal wings.",
    "prompt": "Think of how your upbringing shaped your independence.",
    "example": "values you learned, lessons from mistakes, resilience.",
    "gratitude_example": "I'm grateful that my family gave me both grounding and freedom.",
    "pause_cue": "Let gratitude hold both roots and flight.",
    "placeholder": "Write what you appreciate about that balance."
  },
  {
    "anchor": "Love continues through generations.",
    "prompt": "Recall a family tradition that still continues today.",
    "example": "holiday meal, annual call, shared ritual.",
    "gratitude_example": "I'm grateful for the traditions that keep our family connected across time.",
    "pause_cue": "Feel the thread that connects generations.",
    "placeholder": "Write gratitude for that tradition."
  },
  {
    "anchor": "Every family carries both chaos and care.",
    "prompt": "Think of a funny or messy family moment that still makes you smile.",
    "example": "a dinner gone wrong, travel chaos, shared mistake.",
    "gratitude_example": "I'm grateful for the imperfections that make our family real.",
    "pause_cue": "Let laughter and love exist together.",
    "placeholder": "Write what that moment reminds you about love."
  },
  {
    "anchor": "Family love often hides behind effort.",
    "prompt": "Think of a time someone in your family worked hard for your comfort or happiness.",
    "example": "cooking, planning, taking care of details.",
    "gratitude_example": "I'm grateful for the unseen efforts that hold our family together.",
    "pause_cue": "Acknowledge the care that happens quietly.",
    "placeholder": "Write a thank-you for their effort."
  },
  {
    "anchor": "You carry your family’s kindness forward.",
    "prompt": "Think of a family trait or value you’re proud to continue.",
    "example": "generosity, humor, resilience, honesty.",
    "gratitude_example": "I'm grateful for the goodness passed down that still lives in me.",
    "pause_cue": "Feel continuity instead of obligation.",
    "placeholder": "Write gratitude for what your family taught you to keep."
  },
  {
    "anchor": "Family reminds us of unconditional love.",
    "prompt": "Recall a time you felt loved despite mistakes or differences.",
    "example": "being accepted, comforted, forgiven.",
    "gratitude_example": "I'm grateful for the love that stays even when I falter.",
    "pause_cue": "Let unconditional love feel safe inside you.",
    "placeholder": "Write what you appreciate about being loved anyway."
  }
],
  ),
  
  GratitudeCategory(
    categoryName: "Partner & Love",
    emoji: "💞",
    items: [
  {
    "anchor": "Love is built in moments, not milestones.",
    "prompt": "Think of a small moment with your partner that made you feel deeply connected.",
    "example": "a quiet hug, shared glance, inside joke, holding hands.",
    "gratitude_example": "I'm grateful for the little moments of connection that make love feel effortless.",
    "pause_cue": "Let that simple moment warm your chest again.",
    "placeholder": "Write what you’re thankful for about that shared moment."
  },
  {
    "anchor": "True love is friendship in disguise.",
    "prompt": "Recall a time your partner made you laugh genuinely.",
    "example": "teasing, playful humor, shared silliness.",
    "gratitude_example": "I'm grateful for the laughter we share — it keeps our love alive.",
    "pause_cue": "Let that laughter echo softly in your mind.",
    "placeholder": "Write gratitude for the joy in your connection."
  },
  {
    "anchor": "Love means being fully seen and still accepted.",
    "prompt": "Think of a moment when your partner accepted you without judgment.",
    "example": "during a mistake, a hard day, or a vulnerable confession.",
    "gratitude_example": "I'm grateful for the acceptance that makes me feel safe in love.",
    "pause_cue": "Notice how it feels to be seen and still cherished.",
    "placeholder": "Write what you appreciate about their acceptance."
  },
  {
    "anchor": "Love deepens through understanding, not perfection.",
    "prompt": "Remember a disagreement that brought you closer afterward.",
    "example": "a conversation that healed, learning how to communicate better.",
    "gratitude_example": "I'm grateful that our love can withstand tension and turn it into growth.",
    "pause_cue": "Let gratitude replace any lingering heaviness.",
    "placeholder": "Write what you’re thankful for about learning together."
  },
  {
    "anchor": "Partnership is built on showing up.",
    "prompt": "Think of a time your partner supported you when you needed it most.",
    "example": "staying up late with you, listening, helping practically.",
    "gratitude_example": "I'm grateful for the comfort of knowing I don’t have to face things alone.",
    "pause_cue": "Let appreciation for their reliability rise gently.",
    "placeholder": "Write gratitude for how they showed up for you."
  },
  {
    "anchor": "Love feels like ease after effort.",
    "prompt": "Recall a day or moment where being together felt natural and peaceful.",
    "example": "a quiet dinner, a long walk, watching something side by side.",
    "gratitude_example": "I'm grateful for the peace that fills the spaces between us.",
    "pause_cue": "Breathe into that calm memory.",
    "placeholder": "Write what you appreciate about the ease you share."
  },
  {
    "anchor": "Love is in the details.",
    "prompt": "Think of a small, thoughtful thing your partner does for you.",
    "example": "making coffee, remembering your preferences, checking in during the day.",
    "gratitude_example": "I'm grateful for the thoughtfulness that reminds me I’m cared for.",
    "pause_cue": "Notice how small gestures carry big love.",
    "placeholder": "Write what small action you’re thankful for."
  },
  {
    "anchor": "Loving someone means growing beside them.",
    "prompt": "Recall something new you’ve learned because of your relationship.",
    "example": "patience, vulnerability, communication, compromise.",
    "gratitude_example": "I'm grateful for the lessons love continues to teach me.",
    "pause_cue": "Let appreciation for your shared growth settle in.",
    "placeholder": "Write what you’re thankful to have learned together."
  },
  {
    "anchor": "Every love has its own rhythm.",
    "prompt": "Think of a ritual or routine that’s uniquely yours as a couple.",
    "example": "nightly talks, weekend breakfast, shared playlist.",
    "gratitude_example": "I'm grateful for the little rituals that make our love feel like home.",
    "pause_cue": "Feel comfort in that shared rhythm.",
    "placeholder": "Write gratitude for that habit or ritual."
  },
  {
    "anchor": "Love means choosing again and again.",
    "prompt": "Remember a day when you consciously chose love over frustration or pride.",
    "example": "apologizing first, being patient, letting go of control.",
    "gratitude_example": "I'm grateful for my ability to keep choosing love daily.",
    "pause_cue": "Notice how choosing love feels like peace, not effort.",
    "placeholder": "Write what you appreciate about that moment of choice."
  },
  {
    "anchor": "Love grows when we listen deeply.",
    "prompt": "Recall a moment your partner truly listened and understood you.",
    "example": "when you felt heard, not just answered.",
    "gratitude_example": "I'm grateful for the way they listen — it makes me feel valued.",
    "pause_cue": "Let the feeling of being heard settle inside you.",
    "placeholder": "Write gratitude for their attentive heart."
  },
  {
    "anchor": "Affection doesn’t always need words.",
    "prompt": "Think of a simple touch or glance that made you feel loved.",
    "example": "holding hands, forehead kiss, resting together.",
    "gratitude_example": "I'm grateful for the unspoken gestures that say ‘I love you.’",
    "pause_cue": "Feel that memory on your skin again.",
    "placeholder": "Write what you’re thankful for about that quiet affection."
  },
  {
    "anchor": "Love matures with time, not effort.",
    "prompt": "Think of how your love has deepened or softened over time.",
    "example": "growing patience, more comfort in silence, steadier understanding.",
    "gratitude_example": "I'm grateful for how our love keeps evolving with grace.",
    "pause_cue": "Let that sense of depth feel grounding.",
    "placeholder": "Write gratitude for how your love has grown."
  },
  {
    "anchor": "Love makes room for individuality.",
    "prompt": "Recall how your partner supports your independence or growth.",
    "example": "encouraging hobbies, giving space, believing in your goals.",
    "gratitude_example": "I'm grateful for love that lets me grow freely while feeling supported.",
    "pause_cue": "Feel how freedom strengthens connection.",
    "placeholder": "Write what you appreciate about their support."
  },
  {
    "anchor": "Love forgives without keeping score.",
    "prompt": "Think of a time you forgave each other and moved forward.",
    "example": "misunderstanding, small mistake, emotional slip.",
    "gratitude_example": "I'm grateful for the forgiveness that keeps our love gentle.",
    "pause_cue": "Let that softness return to your heart.",
    "placeholder": "Write what you’re thankful for about forgiveness in love."
  },
  {
    "anchor": "Love is remembering their world, too.",
    "prompt": "Think of something your partner cares about that you support.",
    "example": "their dreams, passions, comfort habits.",
    "gratitude_example": "I'm grateful that love has taught me to care for their joy as much as mine.",
    "pause_cue": "Notice the fulfillment that comes from mutual care.",
    "placeholder": "Write gratitude for what you support together."
  },
  {
    "anchor": "Love means feeling safe in someone’s eyes.",
    "prompt": "Think of a look or embrace that reminded you you’re loved deeply.",
    "example": "eye contact after a long day, comforting hug, gentle smile.",
    "gratitude_example": "I'm grateful for the safety I feel in their eyes.",
    "pause_cue": "Breathe in that feeling of being safe and loved.",
    "placeholder": "Write what you’re grateful for about that safety."
  },
  {
    "anchor": "Love is both anchor and adventure.",
    "prompt": "Recall a shared adventure or new experience that strengthened your bond.",
    "example": "traveling, learning something new, trying a challenge together.",
    "gratitude_example": "I'm grateful for every shared experience that reminds me how fun love can be.",
    "pause_cue": "Smile at how love makes life an adventure.",
    "placeholder": "Write gratitude for that experience together."
  },
  {
    "anchor": "Love listens even in silence.",
    "prompt": "Think of a quiet moment that spoke volumes.",
    "example": "lying together, sharing a sunset, just being near.",
    "gratitude_example": "I'm grateful for the silence between us that feels like understanding.",
    "pause_cue": "Let peace fill that remembered moment.",
    "placeholder": "Write what you’re thankful for about that silence."
  },
  {
    "anchor": "Love endures through imperfection.",
    "prompt": "Recall a challenging season that strengthened your connection.",
    "example": "distance, stress, personal growth periods.",
    "gratitude_example": "I'm grateful for the challenges that made our love resilient.",
    "pause_cue": "Feel pride in the endurance of your love.",
    "placeholder": "Write gratitude for what you’ve overcome together."
  },
  {
    "anchor": "Real love means mutual gratitude.",
    "prompt": "Think of a moment when your partner thanked you genuinely.",
    "example": "appreciation for your effort, support, or presence.",
    "gratitude_example": "I'm grateful for being appreciated — it reminds me love goes both ways.",
    "pause_cue": "Let that appreciation return to your heart.",
    "placeholder": "Write gratitude for being valued in love."
  },
  {
    "anchor": "Love evolves when we grow individually.",
    "prompt": "Think of a time both of you grew in different ways yet stayed connected.",
    "example": "pursuing goals, learning separately, changing routines.",
    "gratitude_example": "I'm grateful that our love leaves space for both togetherness and individuality.",
    "pause_cue": "Feel pride in the balance you maintain.",
    "placeholder": "Write what you’re thankful for about that harmony."
  },
  {
    "anchor": "Love means remembering kindness in hard times.",
    "prompt": "Recall a moment of gentleness during a difficult phase.",
    "example": "comforting words, patience, understanding silence.",
    "gratitude_example": "I'm grateful for the kindness that softened our hardest days.",
    "pause_cue": "Let that tenderness fill your memory.",
    "placeholder": "Write gratitude for the compassion in your love."
  },
  {
    "anchor": "Love thrives in daily gratitude.",
    "prompt": "Think of one thing you appreciate about your partner today.",
    "example": "their humor, steadiness, voice, presence.",
    "gratitude_example": "I'm grateful for the small ways they make every day feel steadier.",
    "pause_cue": "Smile at how gratitude strengthens love.",
    "placeholder": "Write what you’re thankful for about them right now."
  },
  {
    "anchor": "Love remains even through change.",
    "prompt": "Think of how your relationship has adapted with time or distance.",
    "example": "changing schedules, moving cities, growing older together.",
    "gratitude_example": "I'm grateful for a love that changes form but not depth.",
    "pause_cue": "Feel reassurance in that constancy.",
    "placeholder": "Write gratitude for how your love adapts."
  }
],
  ),
  
  GratitudeCategory(
    categoryName: "Children & Parenthood",
    emoji: "💞",
    items: [
  {
    "anchor": "Children remind us of wonder.",
    "prompt": "Think of a moment when your child made you see the world differently.",
    "example": "their curiosity, their laughter, their unexpected question.",
    "gratitude_example": "I'm grateful for how my child helps me rediscover joy in small things.",
    "pause_cue": "Let that innocent wonder fill you again.",
    "placeholder": "Write what you’re thankful for about that moment of discovery."
  },
  {
    "anchor": "Love grows with every tiny heartbeat.",
    "prompt": "Recall a moment when you simply watched your child and felt pure love.",
    "example": "while they were sleeping, playing, or laughing freely.",
    "gratitude_example": "I'm grateful for the quiet love I feel just watching them exist.",
    "pause_cue": "Breathe in that warmth that only parenthood brings.",
    "placeholder": "Write what fills your heart about that simple moment."
  },
  {
    "anchor": "Parenthood teaches unconditional love.",
    "prompt": "Think of a time you loved your child without expecting anything back.",
    "example": "comforting them through tears, staying patient during chaos.",
    "gratitude_example": "I'm grateful that my love for them asks for nothing and gives everything.",
    "pause_cue": "Feel how that unconditional care expands your heart.",
    "placeholder": "Write what you’re thankful for about that endless love."
  },
  {
    "anchor": "Their laughter is the music of home.",
    "prompt": "Recall a time your child’s laughter filled the room.",
    "example": "playing together, hearing their giggles, spontaneous joy.",
    "gratitude_example": "I'm grateful for their laughter that makes every space brighter.",
    "pause_cue": "Let that sound echo softly in your memory.",
    "placeholder": "Write gratitude for the laughter that fills your home."
  },
  {
    "anchor": "Children teach us patience and softness.",
    "prompt": "Think of a time your child tested your patience and you chose understanding.",
    "example": "calming a tantrum, answering questions, forgiving mistakes.",
    "gratitude_example": "I'm grateful for how being a parent makes me more patient and kind.",
    "pause_cue": "Feel the growth that came from that moment.",
    "placeholder": "Write what you appreciate about learning patience through them."
  },
  {
    "anchor": "Parenthood means learning daily.",
    "prompt": "Recall something your child taught you recently.",
    "example": "how to slow down, laugh more, or forgive faster.",
    "gratitude_example": "I'm grateful for how my child reminds me to live with curiosity and love.",
    "pause_cue": "Let gratitude grow for the lessons that come from little hearts.",
    "placeholder": "Write what your child taught you that you’re thankful for."
  },
  {
    "anchor": "Love hides in small rituals.",
    "prompt": "Think of a small routine you share with your child.",
    "example": "bedtime stories, morning cuddles, school goodbyes.",
    "gratitude_example": "I'm grateful for our rituals that turn ordinary days into memories.",
    "pause_cue": "Feel the tenderness in that simple routine.",
    "placeholder": "Write what ritual you cherish most with your child."
  },
  {
    "anchor": "Children mirror our best selves.",
    "prompt": "Think of a moment when your child reflected your love or kindness.",
    "example": "they helped someone, shared kindly, comforted you.",
    "gratitude_example": "I'm grateful for seeing my love reflected in how they love others.",
    "pause_cue": "Notice how love multiplies through them.",
    "placeholder": "Write what you’re thankful for about that reflection."
  },
  {
    "anchor": "Parenthood is made of small victories.",
    "prompt": "Recall a proud moment you had watching your child grow.",
    "example": "learning a skill, facing fear, showing courage.",
    "gratitude_example": "I'm grateful for their strength and how it fills me with pride and joy.",
    "pause_cue": "Let that pride feel peaceful, not pressured.",
    "placeholder": "Write gratitude for their growth and courage."
  },
  {
    "anchor": "Parenting is love in motion.",
    "prompt": "Think of something you did recently to make your child feel loved.",
    "example": "preparing their favorite meal, listening, spending time together.",
    "gratitude_example": "I'm grateful for the small ways I get to show love to my child each day.",
    "pause_cue": "Let that act remind you of your love in action.",
    "placeholder": "Write what moment of care you’re thankful for."
  },
  {
    "anchor": "You’re growing alongside them.",
    "prompt": "Think of how you’ve changed since becoming a parent.",
    "example": "more empathy, more patience, deeper strength.",
    "gratitude_example": "I'm grateful for how parenthood has expanded my heart and perspective.",
    "pause_cue": "Feel appreciation for your own growth, too.",
    "placeholder": "Write what you’re thankful for about your own transformation."
  },
  {
    "anchor": "Their trust is sacred.",
    "prompt": "Recall a moment your child reached for you or confided in you.",
    "example": "holding your hand, telling a secret, seeking comfort.",
    "gratitude_example": "I'm grateful for their trust — it’s the purest kind of love.",
    "pause_cue": "Let that moment remind you how deeply they rely on you.",
    "placeholder": "Write gratitude for their trust and closeness."
  },
  {
    "anchor": "Children teach us presence.",
    "prompt": "Think of a time your child pulled you into the present moment.",
    "example": "playing freely, asking to look at clouds, needing attention now.",
    "gratitude_example": "I'm grateful for how my child anchors me in the now.",
    "pause_cue": "Breathe and feel the gift of presence they bring.",
    "placeholder": "Write what moment made you slow down with gratitude."
  },
  {
    "anchor": "Parenthood is love that never clocks out.",
    "prompt": "Remember a night or day you cared for them even when exhausted.",
    "example": "staying up late, soothing their worries, keeping calm.",
    "gratitude_example": "I'm grateful for the strength love gives me to keep going for them.",
    "pause_cue": "Let that devotion feel seen and appreciated.",
    "placeholder": "Write what you’re thankful for about your own dedication."
  },
  {
    "anchor": "Their milestones are your quiet triumphs.",
    "prompt": "Recall a milestone your child reached that filled you with emotion.",
    "example": "first steps, school start, first achievement.",
    "gratitude_example": "I'm grateful for every milestone that reminds me how far we’ve both come.",
    "pause_cue": "Let pride mix gently with love.",
    "placeholder": "Write gratitude for that shared moment of growth."
  },
  {
    "anchor": "Children remind us to play.",
    "prompt": "Think of a fun or silly moment you shared together.",
    "example": "dancing, drawing, pretending, running freely.",
    "gratitude_example": "I'm grateful for how my child brings laughter back into my days.",
    "pause_cue": "Let that playful memory lighten you.",
    "placeholder": "Write what you loved about that playfulness."
  },
  {
    "anchor": "Parenthood is constant discovery.",
    "prompt": "Think of something new you noticed about your child recently.",
    "example": "a new skill, favorite phrase, growing confidence.",
    "gratitude_example": "I'm grateful for discovering who my child is becoming day by day.",
    "pause_cue": "Feel awe at how fast they’re growing.",
    "placeholder": "Write what you’re thankful for about that realization."
  },
  {
    "anchor": "Love multiplies through patience.",
    "prompt": "Think of a time you stayed calm when it wasn’t easy.",
    "example": "dealing with a mess, big feelings, unexpected chaos.",
    "gratitude_example": "I'm grateful that love teaches me patience again and again.",
    "pause_cue": "Let that calm remind you of your growth.",
    "placeholder": "Write gratitude for the patience you found."
  },
  {
    "anchor": "Your love is their safe harbor.",
    "prompt": "Think of a time your child returned to you for comfort.",
    "example": "after a hard day, after failing, or just needing reassurance.",
    "gratitude_example": "I'm grateful that my child feels safe enough to return to my arms.",
    "pause_cue": "Feel the safety and trust flowing both ways.",
    "placeholder": "Write what you appreciate about being their safe place."
  },
  {
    "anchor": "Children bring purpose into the ordinary.",
    "prompt": "Think of an everyday task that feels meaningful because of them.",
    "example": "cooking meals, organizing, reading stories.",
    "gratitude_example": "I'm grateful for how parenthood turns small tasks into acts of love.",
    "pause_cue": "Let appreciation rise for the simple routines of care.",
    "placeholder": "Write gratitude for the meaning they add to daily life."
  },
  {
    "anchor": "Their curiosity keeps your spirit young.",
    "prompt": "Recall a question or wonder they shared that made you smile.",
    "example": "funny why-questions, deep thoughts, creative ideas.",
    "gratitude_example": "I'm grateful for how my child’s curiosity reminds me to stay amazed.",
    "pause_cue": "Let wonder replace worry for a moment.",
    "placeholder": "Write what you’re thankful for about that spark of curiosity."
  },
  {
    "anchor": "Parenthood is a love story written daily.",
    "prompt": "Think of how your love for your child has evolved over time.",
    "example": "from protection to pride, from exhaustion to joy.",
    "gratitude_example": "I'm grateful for how my love keeps deepening with every stage of their life.",
    "pause_cue": "Breathe and feel the story you’re still writing together.",
    "placeholder": "Write gratitude for the journey you share."
  },
  {
    "anchor": "You give love they’ll remember forever.",
    "prompt": "Think of something your child might remember about your care.",
    "example": "bedtime kisses, encouragement, showing up.",
    "gratitude_example": "I'm grateful to be shaping memories of love that will outlive words.",
    "pause_cue": "Let that purpose bring peace and pride.",
    "placeholder": "Write what memory you hope they’ll carry forward."
  },
  {
    "anchor": "Children remind us to love without fear.",
    "prompt": "Think of a time their innocence softened your heart.",
    "example": "unexpected kindness, open affection, spontaneous love.",
    "gratitude_example": "I'm grateful for how their purity keeps my heart open and gentle.",
    "pause_cue": "Feel how innocence renews your love.",
    "placeholder": "Write what you’re thankful for about their open heart."
  },
  {
    "anchor": "Parenthood is equal parts chaos and grace.",
    "prompt": "Recall a messy, funny, or unpredictable parenting moment that now makes you smile.",
    "example": "food spills, bedtime battles, hilarious mistakes.",
    "gratitude_example": "I'm grateful for the beautiful mess that comes with loving them fully.",
    "pause_cue": "Laugh softly — even chaos can be love in disguise.",
    "placeholder": "Write what you appreciate about that imperfect moment."
  }
],
  ),
  
  GratitudeCategory(
    categoryName: "Pets & Companions",
    emoji: "💞",
    items: [
  {
    "anchor": "Their eyes hold a world of trust.",
    "prompt": "Think of a moment when your pet looked at you with pure love.",
    "example": "greeting you at the door, curling beside you, resting their head on you.",
    "gratitude_example": "I'm grateful for the quiet trust my pet places in me every day.",
    "pause_cue": "Let that loyal gaze linger in your mind.",
    "placeholder": "Write what you’re thankful for about their trust."
  },
  {
    "anchor": "They love without reason.",
    "prompt": "Recall a time your pet comforted you without knowing why you were sad.",
    "example": "sitting near you, resting on your lap, nudging your hand.",
    "gratitude_example": "I'm grateful for the unconditional love that never asks for explanations.",
    "pause_cue": "Feel how their love softens heavy moments.",
    "placeholder": "Write gratitude for their pure presence."
  },
  {
    "anchor": "Joy can wag, purr, or chirp.",
    "prompt": "Think of something your pet does that makes you smile instantly.",
    "example": "funny habits, zoomies, quirky sounds.",
    "gratitude_example": "I'm grateful for the joy my pet brings into ordinary days.",
    "pause_cue": "Let that small joy lift your mood again.",
    "placeholder": "Write what you appreciate about their playfulness."
  },
  {
    "anchor": "Companionship needs no words.",
    "prompt": "Recall a peaceful moment spent quietly with your pet.",
    "example": "watching TV together, lying nearby, sharing silence.",
    "gratitude_example": "I'm grateful for the calm that comes from simply being together.",
    "pause_cue": "Notice the peace that fills wordless connection.",
    "placeholder": "Write gratitude for their quiet companionship."
  },
  {
    "anchor": "Pets remind us to be present.",
    "prompt": "Think of a simple daily moment you share — feeding, walking, cuddling.",
    "example": "morning routine, evening play, gentle pats.",
    "gratitude_example": "I'm grateful for how my pet keeps me grounded in the now.",
    "pause_cue": "Let that everyday ritual feel sacred.",
    "placeholder": "Write what moment with them you’re thankful for."
  },
  {
    "anchor": "Their love heals silently.",
    "prompt": "Recall a hard day made easier because of your pet’s presence.",
    "example": "they stayed near, made you laugh, helped you feel less alone.",
    "gratitude_example": "I'm grateful for the comfort my pet gives when words can’t help.",
    "pause_cue": "Feel the healing power of their closeness.",
    "placeholder": "Write gratitude for how they soothe you."
  },
  {
    "anchor": "They trust us completely.",
    "prompt": "Think of how your pet shows trust or dependence on you.",
    "example": "sleeping peacefully beside you, following you around.",
    "gratitude_example": "I'm grateful for being trusted by a soul so pure.",
    "pause_cue": "Let responsibility feel like love, not burden.",
    "placeholder": "Write what you cherish about earning their trust."
  },
  {
    "anchor": "Love can be furry, feathered, or scaled.",
    "prompt": "Think of what makes your pet uniquely them.",
    "example": "patterns, sounds, funny expressions, small quirks.",
    "gratitude_example": "I'm grateful for every unique trait that makes them irreplaceable.",
    "pause_cue": "Smile at their individuality.",
    "placeholder": "Write what small detail about them warms you most."
  },
  {
    "anchor": "Caring is its own reward.",
    "prompt": "Think of a way you care for your pet that feels meaningful.",
    "example": "grooming, preparing food, medical care, walks.",
    "gratitude_example": "I'm grateful for the chance to love through small acts of care.",
    "pause_cue": "Notice how giving nurtures connection.",
    "placeholder": "Write gratitude for being able to care for them."
  },
  {
    "anchor": "They remind us to rest.",
    "prompt": "Recall your pet’s calm moments that make you slow down too.",
    "example": "napping, sunbathing, lying peacefully.",
    "gratitude_example": "I'm grateful for how my pet teaches me to relax without guilt.",
    "pause_cue": "Let their calm energy settle into you.",
    "placeholder": "Write what you appreciate about their serenity."
  },
  {
    "anchor": "Goodbyes are proof of love.",
    "prompt": "Think of a pet you’ve lost or miss and the love that remains.",
    "example": "favorite toy, memory, place you shared.",
    "gratitude_example": "I'm grateful for the love that still lives in the memories of my pet.",
    "pause_cue": "Let missing them feel like honoring them.",
    "placeholder": "Write gratitude for the time you had together."
  },
  {
    "anchor": "They remind us that love is simple.",
    "prompt": "Recall how easily your pet forgives or moves on.",
    "example": "after being scolded, after you leave for work, after mistakes.",
    "gratitude_example": "I'm grateful for how my pet loves freely, teaching me to let go.",
    "pause_cue": "Breathe in that simplicity of heart.",
    "placeholder": "Write what you’re thankful for about their forgiving nature."
  },
  {
    "anchor": "Every day with them is a small miracle.",
    "prompt": "Think of a reason your pet makes life better daily.",
    "example": "routine, warmth, laughter, companionship.",
    "gratitude_example": "I'm grateful for their constant reminder that love is everyday magic.",
    "pause_cue": "Let appreciation ripple through your chest.",
    "placeholder": "Write what you’re grateful for about having them today."
  },
  {
    "anchor": "Their excitement says, 'You matter.'",
    "prompt": "Recall how your pet greets you after time apart.",
    "example": "tail wag, happy sounds, running to you.",
    "gratitude_example": "I'm grateful for being loved with such joyful honesty.",
    "pause_cue": "Let that memory brighten your face.",
    "placeholder": "Write gratitude for how happy they are to see you."
  },
  {
    "anchor": "They listen without judgment.",
    "prompt": "Think of times you’ve talked or vented to your pet.",
    "example": "sharing secrets, crying, silent company.",
    "gratitude_example": "I'm grateful for how my pet listens and makes me feel understood.",
    "pause_cue": "Feel the safety of their silent companionship.",
    "placeholder": "Write what you appreciate about being able to confide in them."
  },
  {
    "anchor": "Love can be as soft as fur and as loyal as heartbeat.",
    "prompt": "Think of the warmth you feel when you hold or pet them.",
    "example": "stroking their fur, feeling their heartbeat, shared calm.",
    "gratitude_example": "I'm grateful for the tactile comfort that love can bring.",
    "pause_cue": "Let that sense of warmth spread in your hands and chest.",
    "placeholder": "Write what you’re thankful for about that closeness."
  },
  {
    "anchor": "They bring rhythm to our days.",
    "prompt": "Think of how your pet’s needs shape your daily life positively.",
    "example": "morning walks, feeding time, outdoor breaks.",
    "gratitude_example": "I'm grateful for how my pet keeps my days steady and full of purpose.",
    "pause_cue": "Notice how care gives structure and meaning.",
    "placeholder": "Write gratitude for the routine you share."
  },
  {
    "anchor": "Their loyalty is a lesson in love.",
    "prompt": "Recall a moment when your pet stayed close no matter what.",
    "example": "illness, sadness, quiet days.",
    "gratitude_example": "I'm grateful for loyalty that never wavers, even in silence.",
    "pause_cue": "Let that unwavering love humble you.",
    "placeholder": "Write what you appreciate about their devotion."
  },
  {
    "anchor": "They teach us to celebrate simple pleasures.",
    "prompt": "Think of how your pet enjoys small things fully.",
    "example": "a walk, a toy, a treat, fresh air.",
    "gratitude_example": "I'm grateful for how my pet reminds me that joy lives in simple things.",
    "pause_cue": "Let that simplicity bring a smile.",
    "placeholder": "Write what simple joy you’re thankful for today."
  },
  {
    "anchor": "Love doesn’t need language.",
    "prompt": "Think of how your pet communicates love without words.",
    "example": "leaning on you, playful sounds, following you around.",
    "gratitude_example": "I'm grateful for love that doesn’t need to be spoken to be felt.",
    "pause_cue": "Feel that unspoken bond glowing quietly.",
    "placeholder": "Write what gestures make you feel loved by them."
  },
  {
    "anchor": "They make solitude feel like company.",
    "prompt": "Recall a moment you felt comforted by their presence while alone.",
    "example": "reading, working, healing, resting.",
    "gratitude_example": "I'm grateful that with them, alone never feels lonely.",
    "pause_cue": "Let appreciation soften your solitude.",
    "placeholder": "Write what you’re thankful for about that companionship."
  },
  {
    "anchor": "Their life reminds us to cherish time.",
    "prompt": "Think of how quickly they grow or change, and what you cherish most now.",
    "example": "puppy to adult, new habits, slowing pace.",
    "gratitude_example": "I'm grateful for every shared day — a gift I don’t take lightly.",
    "pause_cue": "Feel gratitude deepen for this moment together.",
    "placeholder": "Write what you’re thankful for about their presence today."
  },
  {
    "anchor": "They awaken the caretaker in us.",
    "prompt": "Think of how your pet brings out your nurturing side.",
    "example": "protecting, feeding, comforting them.",
    "gratitude_example": "I'm grateful for how caring for my pet helps me express love more freely.",
    "pause_cue": "Feel warmth for the tenderness they awaken.",
    "placeholder": "Write gratitude for what they bring out in you."
  },
  {
    "anchor": "Every pawprint marks a memory.",
    "prompt": "Think of one moment with your pet you’ll never forget.",
    "example": "a first day, a trip, a unique expression.",
    "gratitude_example": "I'm grateful for the memories that their pawprints left on my heart.",
    "pause_cue": "Let nostalgia feel gentle, not sad.",
    "placeholder": "Write what memory still makes you smile."
  },
  {
    "anchor": "They love you exactly as you are.",
    "prompt": "Think of a moment you felt completely accepted by your pet.",
    "example": "no judgment, unconditional affection, calm presence.",
    "gratitude_example": "I'm grateful for the rare comfort of being loved without needing to change.",
    "pause_cue": "Let that acceptance wrap around you like warmth.",
    "placeholder": "Write what you appreciate about their unconditional love."
  }
],
  ),
  
  GratitudeCategory(
    categoryName: "Health & Body",
    emoji: "💞",
    items: [
  {
    "anchor": "Your body is your oldest home.",
    "prompt": "Take a moment to appreciate how your body carries you through life.",
    "example": "walking, breathing, healing, hugging, moving with strength.",
    "gratitude_example": "I'm grateful for the body that shows up for me every single day.",
    "pause_cue": "Place a hand over your heart and feel it working without asking for thanks.",
    "placeholder": "Write what you appreciate about your body right now."
  },
  {
    "anchor": "Health is quiet until we notice it.",
    "prompt": "Think of something your body does automatically that you rarely thank it for.",
    "example": "blinking, digestion, steady breath, heartbeats.",
    "gratitude_example": "I'm grateful for the unseen systems that keep me alive and moving.",
    "pause_cue": "Let awareness turn into appreciation.",
    "placeholder": "Write what silent strength you’re thankful for."
  },
  {
    "anchor": "Healing happens in small, unseen ways.",
    "prompt": "Recall a time your body or mind healed, even slowly.",
    "example": "recovery from illness, heartbreak, stress, or exhaustion.",
    "gratitude_example": "I'm grateful for my body’s quiet determination to restore balance.",
    "pause_cue": "Breathe in gentleness for your healing journey.",
    "placeholder": "Write what healing you’re thankful for today."
  },
  {
    "anchor": "Movement is a celebration, not a punishment.",
    "prompt": "Think of a way you enjoy moving your body.",
    "example": "dancing, stretching, walking, breathing deeply.",
    "gratitude_example": "I'm grateful that movement reminds me what freedom feels like.",
    "pause_cue": "Let joy, not obligation, guide your body’s rhythm.",
    "placeholder": "Write what movement you’re thankful for."
  },
  {
    "anchor": "Rest is a form of respect for the body.",
    "prompt": "Think of how your body feels when you finally rest.",
    "example": "lying down after a long day, quiet moments before sleep.",
    "gratitude_example": "I'm grateful for the rest that helps my body repair and my mind reset.",
    "pause_cue": "Let stillness feel sacred, not lazy.",
    "placeholder": "Write gratitude for the rest your body deserves."
  },
  {
    "anchor": "Your breath connects body and mind.",
    "prompt": "Focus on how your breath feels right now — no need to change it.",
    "example": "slow inhale, long exhale, calm rhythm.",
    "gratitude_example": "I'm grateful for the breath that anchors me to the present.",
    "pause_cue": "Follow one gentle breath in and out.",
    "placeholder": "Write what breathing reminds you to appreciate."
  },
  {
    "anchor": "Every scar tells a story of resilience.",
    "prompt": "Think of a mark or pain that once hurt but now shows healing.",
    "example": "physical scar, emotional wound, past exhaustion.",
    "gratitude_example": "I'm grateful for my body’s proof of healing — visible or invisible.",
    "pause_cue": "Let strength feel like softness that survived.",
    "placeholder": "Write gratitude for the resilience your body holds."
  },
  {
    "anchor": "Food is love turned into energy.",
    "prompt": "Think of the nourishment you’ve given your body recently.",
    "example": "healthy meal, favorite treat, glass of water.",
    "gratitude_example": "I'm grateful for the nourishment that keeps me alive and joyful.",
    "pause_cue": "Feel appreciation for being cared for through food.",
    "placeholder": "Write what meal or nourishment you’re thankful for today."
  },
  {
    "anchor": "Your body is doing its best with what it has.",
    "prompt": "Think of a part of your body you often criticize but that still serves you.",
    "example": "tired eyes, sore legs, aging skin.",
    "gratitude_example": "I'm grateful for every part of me that keeps showing up despite my doubt.",
    "pause_cue": "Let self-compassion soften self-judgment.",
    "placeholder": "Write gratitude for a body part you want to honor today."
  },
  {
    "anchor": "Energy ebbs and flows — and that’s okay.",
    "prompt": "Recall a day when your body needed rest more than results.",
    "example": "fatigue, needing to pause, saying no.",
    "gratitude_example": "I'm grateful for listening to my body when it asks me to slow down.",
    "pause_cue": "Let permission replace pressure.",
    "placeholder": "Write what you appreciate about resting when needed."
  },
  {
    "anchor": "Health includes how you speak to yourself.",
    "prompt": "Think of one kind thing you can tell your body today.",
    "example": "'thank you for trying,' 'I trust you,' 'I forgive you.'",
    "gratitude_example": "I'm grateful for learning to talk to myself with kindness, not critique.",
    "pause_cue": "Whisper something gentle inwardly.",
    "placeholder": "Write a kind thought toward your body."
  },
  {
    "anchor": "Your senses keep you connected to life.",
    "prompt": "Think of a sensory experience that made you feel alive recently.",
    "example": "warm shower, taste of fruit, fresh air, music, scent of coffee.",
    "gratitude_example": "I'm grateful for my senses that let me fully experience this world.",
    "pause_cue": "Let appreciation spread through every sense.",
    "placeholder": "Write what sensory joy you’re thankful for today."
  },
  {
    "anchor": "Sleep repairs what the day forgets.",
    "prompt": "Recall a night of truly restful sleep or deep relaxation.",
    "example": "waking up clear-headed, feeling refreshed.",
    "gratitude_example": "I'm grateful for the sleep that resets my mind and body.",
    "pause_cue": "Let calm wash over you like rest itself.",
    "placeholder": "Write what you appreciate about rest and renewal."
  },
  {
    "anchor": "Health is not a race — it’s a relationship.",
    "prompt": "Think of how you can treat your body as a partner, not a project.",
    "example": "moving with joy, feeding with care, resting without guilt.",
    "gratitude_example": "I'm grateful for learning to listen to my body instead of control it.",
    "pause_cue": "Let gratitude replace expectation.",
    "placeholder": "Write what you want to thank your body for teaching you."
  },
  {
    "anchor": "Pain is a messenger, not an enemy.",
    "prompt": "Think of a time discomfort or pain guided you to make a change.",
    "example": "resting, asking for help, slowing down, reflecting.",
    "gratitude_example": "I'm grateful for my body’s wisdom that speaks even through discomfort.",
    "pause_cue": "Let pain feel like guidance, not punishment.",
    "placeholder": "Write what lesson your body has taught through signals."
  },
  {
    "anchor": "Strength comes in many forms.",
    "prompt": "Recall a moment you felt strong — physically, emotionally, or mentally.",
    "example": "finishing a task, recovering, staying kind through struggle.",
    "gratitude_example": "I'm grateful for the quiet strength that carries me through challenges.",
    "pause_cue": "Let pride soften into gratitude.",
    "placeholder": "Write what strength you’re thankful for today."
  },
  {
    "anchor": "Balance is an act of kindness to yourself.",
    "prompt": "Think of how you balance work, rest, movement, and play.",
    "example": "finding time for joy, avoiding burnout, slowing down.",
    "gratitude_example": "I'm grateful for learning to value balance as much as ambition.",
    "pause_cue": "Let that awareness feel like harmony.",
    "placeholder": "Write what balance means to you today."
  },
  {
    "anchor": "Your heartbeat is proof of persistence.",
    "prompt": "Pause and notice your heartbeat — it’s been with you through everything.",
    "example": "moments of love, fear, laughter, and rest.",
    "gratitude_example": "I'm grateful for my heart that keeps me alive without needing applause.",
    "pause_cue": "Place your hand over your heart and thank it silently.",
    "placeholder": "Write what you appreciate about your own aliveness."
  },
  {
    "anchor": "Your body carries memories of joy.",
    "prompt": "Think of a moment your body felt alive with happiness.",
    "example": "dancing, swimming, hugging, running, smiling until your cheeks hurt.",
    "gratitude_example": "I'm grateful for the moments my body remembers as joy.",
    "pause_cue": "Let that memory vibrate gently within you.",
    "placeholder": "Write gratitude for how your body holds joy."
  },
  {
    "anchor": "Well-being is built one small choice at a time.",
    "prompt": "Think of a small healthy choice you made recently.",
    "example": "drinking water, taking a walk, sleeping earlier.",
    "gratitude_example": "I'm grateful for every small action that moves me toward balance.",
    "pause_cue": "Let pride turn into appreciation.",
    "placeholder": "Write gratitude for your small act of self-care."
  },
  {
    "anchor": "Your body belongs to you — not to standards.",
    "prompt": "Think of how your body serves your life beyond how it looks.",
    "example": "carrying you to people you love, helping you create, move, rest.",
    "gratitude_example": "I'm grateful that my body’s worth comes from what it allows me to live, not how it appears.",
    "pause_cue": "Feel the freedom of self-acceptance.",
    "placeholder": "Write gratitude for your body’s purpose beyond appearance."
  },
  {
    "anchor": "Health includes the mind and the heart.",
    "prompt": "Think of something that brought you peace recently.",
    "example": "meditation, talking to someone, journaling, laughter.",
    "gratitude_example": "I'm grateful for the mental calm that supports my physical health.",
    "pause_cue": "Let peace flow through both body and mind.",
    "placeholder": "Write gratitude for what made you feel calm."
  },
  {
    "anchor": "Your body and nature move in rhythm.",
    "prompt": "Think of how your body mirrors nature’s cycles — rest, energy, renewal.",
    "example": "seasons, sleep, breath, heart rhythm.",
    "gratitude_example": "I'm grateful for being part of nature’s beautiful rhythm of life.",
    "pause_cue": "Let your next breath feel like a tide returning.",
    "placeholder": "Write gratitude for how your body flows with life."
  },
  {
    "anchor": "Wellness begins with awareness.",
    "prompt": "Notice one part of your body that feels good right now.",
    "example": "relaxed shoulders, calm breath, warm hands, steady legs.",
    "gratitude_example": "I'm grateful for the parts of me that feel strong and alive right now.",
    "pause_cue": "Let attention become appreciation.",
    "placeholder": "Write what part of you feels well and why you’re grateful for it."
  },
  {
    "anchor": "Being alive is already extraordinary.",
    "prompt": "Take a moment to realize how miraculous existence itself is.",
    "example": "breath, heartbeat, consciousness, movement, connection.",
    "gratitude_example": "I'm grateful simply to be alive and aware in this moment.",
    "pause_cue": "Breathe in aliveness, breathe out gratitude.",
    "placeholder": "Write what makes life feel miraculous today."
  }
],
  ),
  
  GratitudeCategory(
    categoryName: "Work & Purpose",
    emoji: "💞",
    items: [
  {
    "anchor": "Work is more than tasks — it’s expression.",
    "prompt": "Think of something you did recently that felt meaningful, not just productive.",
    "example": "finishing a project, helping someone, creating something new.",
    "gratitude_example": "I'm grateful for the moments when my work feels aligned with who I am.",
    "pause_cue": "Let purpose feel like fulfillment, not pressure.",
    "placeholder": "Write what you’re thankful for about meaningful work."
  },
  {
    "anchor": "Purpose gives direction to effort.",
    "prompt": "Recall a time you felt proud of contributing your skills.",
    "example": "solving a problem, supporting a team, mentoring someone.",
    "gratitude_example": "I'm grateful that my work allows me to make a difference, big or small.",
    "pause_cue": "Let pride turn softly into gratitude.",
    "placeholder": "Write what contribution you’re thankful for today."
  },
  {
    "anchor": "Growth happens one step at a time.",
    "prompt": "Think of how far you’ve come in your professional or personal journey.",
    "example": "skills learned, fears faced, challenges overcome.",
    "gratitude_example": "I'm grateful for the progress I’ve made, even if it’s slow or quiet.",
    "pause_cue": "Let patience feel like strength.",
    "placeholder": "Write what growth you’re thankful for."
  },
  {
    "anchor": "Work can also be service.",
    "prompt": "Think of a way your effort helps others.",
    "example": "supporting a coworker, creating value, making someone’s day easier.",
    "gratitude_example": "I'm grateful that my work reaches others in ways I may not even see.",
    "pause_cue": "Let service feel like connection, not duty.",
    "placeholder": "Write what you’re thankful for about helping others through work."
  },
  {
    "anchor": "Fulfillment comes from alignment, not approval.",
    "prompt": "Think of something you did recently because it felt right — not because it was expected.",
    "example": "taking initiative, saying no, following intuition.",
    "gratitude_example": "I'm grateful for trusting myself enough to act from authenticity.",
    "pause_cue": "Let integrity feel like calm confidence.",
    "placeholder": "Write gratitude for a decision that felt true to you."
  },
  {
    "anchor": "Balance keeps ambition kind.",
    "prompt": "Recall a time you chose rest or personal joy over endless work.",
    "example": "taking a day off, saying no to burnout, enjoying small wins.",
    "gratitude_example": "I'm grateful for realizing that my worth isn’t tied only to productivity.",
    "pause_cue": "Let permission feel like power.",
    "placeholder": "Write what balance means in your work life today."
  },
  {
    "anchor": "Every skill is a form of self-trust.",
    "prompt": "Think of a skill or strength you’ve developed through effort.",
    "example": "communication, patience, focus, creativity.",
    "gratitude_example": "I'm grateful for the abilities that make me capable and confident.",
    "pause_cue": "Acknowledge your growth with quiet pride.",
    "placeholder": "Write what skill or strength you’re thankful for."
  },
  {
    "anchor": "Work is a chance to practice gratitude in motion.",
    "prompt": "Think of something about your work environment that supports you.",
    "example": "a colleague’s kindness, your tools, your workspace, your routine.",
    "gratitude_example": "I'm grateful for the small comforts that make work feel lighter.",
    "pause_cue": "Notice how gratitude shifts how you experience your day.",
    "placeholder": "Write what you appreciate about your workspace or team."
  },
  {
    "anchor": "Purpose often hides in patience.",
    "prompt": "Think of a project or goal that’s taking longer than you hoped.",
    "example": "slow results, uncertain progress, delayed recognition.",
    "gratitude_example": "I'm grateful for the patience my work teaches me every day.",
    "pause_cue": "Let time feel like a teacher, not an obstacle.",
    "placeholder": "Write what long journey you’re learning to be grateful for."
  },
  {
    "anchor": "You are more than your title.",
    "prompt": "Think of what your work represents beyond your role or position.",
    "example": "creativity, kindness, problem-solving, care.",
    "gratitude_example": "I'm grateful that my work lets me express deeper parts of myself.",
    "pause_cue": "Feel appreciation for who you are beyond labels.",
    "placeholder": "Write what quality you bring to your work that you value most."
  },
  {
    "anchor": "Progress can be quiet but powerful.",
    "prompt": "Think of a small win you might’ve overlooked this week.",
    "example": "finishing a task, staying calm, learning something new.",
    "gratitude_example": "I'm grateful for the small victories that build confidence silently.",
    "pause_cue": "Let quiet progress feel satisfying enough.",
    "placeholder": "Write gratitude for a recent small success."
  },
  {
    "anchor": "Work gives rhythm to purpose.",
    "prompt": "Think of a routine that keeps you grounded and focused.",
    "example": "morning planning, coffee ritual, reflection time.",
    "gratitude_example": "I'm grateful for the structure that supports my growth and focus.",
    "pause_cue": "Let gratitude flow for the stability of routine.",
    "placeholder": "Write what daily habit supports your work and peace."
  },
  {
    "anchor": "Purpose can evolve with you.",
    "prompt": "Think of how your work goals or passions have changed over time.",
    "example": "shifting fields, rediscovering creativity, redefining success.",
    "gratitude_example": "I'm grateful for the freedom to keep redefining what success means to me.",
    "pause_cue": "Let openness feel like courage.",
    "placeholder": "Write gratitude for how your purpose is evolving."
  },
  {
    "anchor": "Your effort makes invisible impact.",
    "prompt": "Think of a time your work helped someone, even in small ways.",
    "example": "solving a problem, encouraging, serving, teaching.",
    "gratitude_example": "I'm grateful for knowing that my work touches others beyond my sight.",
    "pause_cue": "Let that invisible ripple feel real and rewarding.",
    "placeholder": "Write what unseen impact you’re grateful for."
  },
  {
    "anchor": "Work teaches resilience through repetition.",
    "prompt": "Think of something you keep showing up for even when it’s hard.",
    "example": "daily discipline, learning curve, setbacks.",
    "gratitude_example": "I'm grateful for the persistence that work strengthens in me.",
    "pause_cue": "Let consistency feel noble, not heavy.",
    "placeholder": "Write what you’re thankful for about your discipline."
  },
  {
    "anchor": "Your career is a collection of moments, not milestones.",
    "prompt": "Recall a small memory from work that made you feel alive.",
    "example": "someone’s gratitude, a spark of creativity, laughter during a break.",
    "gratitude_example": "I'm grateful for the human moments that make work meaningful.",
    "pause_cue": "Smile at that reminder of connection.",
    "placeholder": "Write what moment you’re thankful for today."
  },
  {
    "anchor": "Fulfillment grows in contribution.",
    "prompt": "Think of how your work adds value to the world.",
    "example": "solving needs, creating comfort, inspiring others.",
    "gratitude_example": "I'm grateful for being able to contribute something useful through my work.",
    "pause_cue": "Let pride mix gently with humility.",
    "placeholder": "Write what purpose drives your contribution."
  },
  {
    "anchor": "Work challenges refine who you are.",
    "prompt": "Think of a recent challenge that taught you patience or resilience.",
    "example": "conflict, rejection, delays, feedback.",
    "gratitude_example": "I'm grateful for the lessons hidden in my work’s hardest days.",
    "pause_cue": "Let growth feel worth the discomfort.",
    "placeholder": "Write what challenge taught you something valuable."
  },
  {
    "anchor": "Teamwork reminds us we’re not alone.",
    "prompt": "Think of a colleague or mentor who’s made your path easier.",
    "example": "advice, collaboration, encouragement.",
    "gratitude_example": "I'm grateful for the people who make my work lighter and brighter.",
    "pause_cue": "Let appreciation soften competition into connection.",
    "placeholder": "Write gratitude for someone you work with."
  },
  {
    "anchor": "Creativity is work that comes alive.",
    "prompt": "Recall a time you felt inspired or creative during work.",
    "example": "new idea, problem solved beautifully, artful project.",
    "gratitude_example": "I'm grateful for the spark of creativity that keeps work exciting.",
    "pause_cue": "Let inspiration feel like energy returning.",
    "placeholder": "Write gratitude for a creative moment at work."
  },
  {
    "anchor": "Work can be a mirror for growth.",
    "prompt": "Think of how your work reveals your strengths and limits.",
    "example": "leadership, empathy, organization, boundaries.",
    "gratitude_example": "I'm grateful that work keeps showing me who I’m becoming.",
    "pause_cue": "Let reflection feel gentle, not critical.",
    "placeholder": "Write gratitude for what work has taught about yourself."
  },
  {
    "anchor": "Purpose doesn’t always feel exciting — sometimes it feels steady.",
    "prompt": "Think of the quiet, consistent work you do that sustains others.",
    "example": "behind-the-scenes tasks, maintenance, care work.",
    "gratitude_example": "I'm grateful for the unseen efforts that make things work.",
    "pause_cue": "Let humble effort feel meaningful.",
    "placeholder": "Write what steady work you’re thankful for."
  },
  {
    "anchor": "Gratitude turns work into worship.",
    "prompt": "Think of how appreciation transforms your workday’s mood.",
    "example": "starting with thankfulness, noticing small joys, valuing results.",
    "gratitude_example": "I'm grateful for finding moments of joy even within responsibility.",
    "pause_cue": "Let gratitude soften effort into ease.",
    "placeholder": "Write what part of work you can be thankful for today."
  },
  {
    "anchor": "Success feels lighter when shared.",
    "prompt": "Think of someone who celebrated your wins with you.",
    "example": "teammate, partner, friend who cheered you on.",
    "gratitude_example": "I'm grateful for the people who take pride in my growth.",
    "pause_cue": "Feel joy expand when it’s shared.",
    "placeholder": "Write what shared success you’re thankful for."
  },
  {
    "anchor": "Your work matters — even on quiet days.",
    "prompt": "Think of something you did today that made a small difference.",
    "example": "replying kindly, finishing a task, learning something.",
    "gratitude_example": "I'm grateful that even small efforts have quiet impact.",
    "pause_cue": "Let today’s effort feel enough.",
    "placeholder": "Write what simple act you’re thankful for today."
  }
],
  ),
  
  GratitudeCategory(
    categoryName: "Home & Sanctuary",
    emoji: "💞",
    items: [
  {
    "anchor": "Home is a feeling, not a place.",
    "prompt": "Think of what makes your space feel like home to you.",
    "example": "familiar scents, light in a certain room, objects with meaning.",
    "gratitude_example": "I'm grateful for the warmth and safety my home gives me every day.",
    "pause_cue": "Let comfort fill your breath for a moment.",
    "placeholder": "Write what makes your space feel safe and yours."
  },
  {
    "anchor": "Peace often hides in ordinary corners.",
    "prompt": "Think of a spot in your home that always brings calm.",
    "example": "a chair by the window, your bed, a quiet corner.",
    "gratitude_example": "I'm grateful for the corners of my home that know my peace.",
    "pause_cue": "Let that space come to mind clearly and fully.",
    "placeholder": "Write what place in your home feels like calm itself."
  },
  {
    "anchor": "Walls don’t make a home — love does.",
    "prompt": "Think of the people or memories that fill your home with warmth.",
    "example": "laughter, meals shared, family gatherings, quiet evenings.",
    "gratitude_example": "I'm grateful for the love that lives within my walls.",
    "pause_cue": "Let connection feel like your true foundation.",
    "placeholder": "Write gratitude for the love that fills your home."
  },
  {
    "anchor": "Your home reflects your inner world.",
    "prompt": "Think of something in your home that represents who you are.",
    "example": "photos, books, music, favorite colors, plants.",
    "gratitude_example": "I'm grateful for creating a space that mirrors my soul gently.",
    "pause_cue": "Let belonging feel personal and quiet.",
    "placeholder": "Write what item or space feels most ‘you.’"
  },
  {
    "anchor": "Home is where the day finally exhales.",
    "prompt": "Think of how it feels to return home after a long day.",
    "example": "changing clothes, cooking, sitting in silence, closing the door.",
    "gratitude_example": "I'm grateful for the peace that greets me when I return home.",
    "pause_cue": "Let that sigh of relief fill your chest again.",
    "placeholder": "Write what you appreciate about coming home."
  },
  {
    "anchor": "Every home holds echoes of laughter.",
    "prompt": "Think of a joyful moment that happened in your home.",
    "example": "a celebration, inside joke, shared meal, playful moment.",
    "gratitude_example": "I'm grateful for the laughter that keeps my home light.",
    "pause_cue": "Let that memory brighten your mind.",
    "placeholder": "Write gratitude for that moment of joy."
  },
  {
    "anchor": "Clutter clears when peace grows inside.",
    "prompt": "Think of a time you organized or refreshed your space.",
    "example": "cleaning, decluttering, moving furniture, letting go of old things.",
    "gratitude_example": "I'm grateful for the peace that follows creating order around me.",
    "pause_cue": "Let clarity feel refreshing, not forced.",
    "placeholder": "Write what you appreciate about caring for your space."
  },
  {
    "anchor": "Home shelters both chaos and calm.",
    "prompt": "Think of how your space holds you through both busy and quiet days.",
    "example": "comforting you when tired, celebrating when energized.",
    "gratitude_example": "I'm grateful for my home’s ability to hold every version of me.",
    "pause_cue": "Let safety feel unconditional.",
    "placeholder": "Write gratitude for the way your space supports you."
  },
  {
    "anchor": "Even small spaces can feel expansive with love.",
    "prompt": "Think of how you’ve made a small or simple space feel warm.",
    "example": "adding plants, soft lights, favorite items.",
    "gratitude_example": "I'm grateful for the creativity that helps me build warmth anywhere.",
    "pause_cue": "Let simplicity feel abundant.",
    "placeholder": "Write what makes your home feel rich in comfort."
  },
  {
    "anchor": "Home remembers your quiet moments.",
    "prompt": "Think of a time you sat still and felt safe in your space.",
    "example": "morning coffee, reading, journaling, evening reflection.",
    "gratitude_example": "I'm grateful for the serenity that fills my home during still moments.",
    "pause_cue": "Let quiet feel nurturing, not empty.",
    "placeholder": "Write what peaceful moment you cherish at home."
  },
  {
    "anchor": "Light changes how we see home — and ourselves.",
    "prompt": "Think of how light moves through your home during the day.",
    "example": "morning glow, golden afternoon, night lamp glow.",
    "gratitude_example": "I'm grateful for how light transforms my space into something alive.",
    "pause_cue": "Let that image of light move through your memory.",
    "placeholder": "Write gratitude for the light in your space."
  },
  {
    "anchor": "Every object holds a small story.",
    "prompt": "Think of something in your home that carries meaning or memory.",
    "example": "a gift, souvenir, photo, book, old furniture.",
    "gratitude_example": "I'm grateful for the stories woven into the things I keep close.",
    "pause_cue": "Let nostalgia feel gentle, not heavy.",
    "placeholder": "Write what item in your home you’re thankful for."
  },
  {
    "anchor": "Your sanctuary grows when you care for it.",
    "prompt": "Think of how you maintain or nurture your home environment.",
    "example": "cleaning, decorating, watering plants, cooking.",
    "gratitude_example": "I'm grateful for the time and love I give to the space that shelters me.",
    "pause_cue": "Let caretaking feel sacred, not routine.",
    "placeholder": "Write gratitude for what caring for your home gives you in return."
  },
  {
    "anchor": "Home smells like safety.",
    "prompt": "Think of a scent that defines your home’s comfort.",
    "example": "cooking aroma, candle, fresh laundry, nature through windows.",
    "gratitude_example": "I'm grateful for the familiar smells that instantly make me feel at ease.",
    "pause_cue": "Let scent become memory in your mind.",
    "placeholder": "Write what smell makes your home feel like yours."
  },
  {
    "anchor": "Your home grows with your story.",
    "prompt": "Think of how your space has evolved as you have.",
    "example": "new objects, rearrangements, fresh energy, new memories.",
    "gratitude_example": "I'm grateful for how my home changes as I grow.",
    "pause_cue": "Let evolution feel beautiful, not disruptive.",
    "placeholder": "Write what change in your home you’re thankful for."
  },
  {
    "anchor": "Safety is the softest luxury.",
    "prompt": "Think of a moment you felt completely safe at home.",
    "example": "resting, healing, escaping stress, feeling protected.",
    "gratitude_example": "I'm grateful for the safety that my home offers without demand.",
    "pause_cue": "Let calm settle like a blanket over you.",
    "placeholder": "Write what moment of safety you’re thankful for."
  },
  {
    "anchor": "Home gives permission to rest.",
    "prompt": "Think of your favorite way to rest in your space.",
    "example": "reading, napping, lying on the floor, doing nothing.",
    "gratitude_example": "I'm grateful for having a space where rest feels natural.",
    "pause_cue": "Let your breath slow as if you were already resting.",
    "placeholder": "Write gratitude for how your home holds your rest."
  },
  {
    "anchor": "Even quiet homes hum with life.",
    "prompt": "Think of the gentle sounds that fill your home’s silence.",
    "example": "clock ticking, fridge hum, birds outside, city sounds faintly.",
    "gratitude_example": "I'm grateful for the living quiet that surrounds my home.",
    "pause_cue": "Let stillness feel alive instead of empty.",
    "placeholder": "Write what sound in your home feels comforting."
  },
  {
    "anchor": "Gratitude turns a house into sanctuary.",
    "prompt": "Think of how you can bring more peace into your home intentionally.",
    "example": "decluttering, adding plants, lighting candles, pausing to breathe.",
    "gratitude_example": "I'm grateful for being able to turn my space into a reflection of calm.",
    "pause_cue": "Let intention feel like peace in motion.",
    "placeholder": "Write one way you’d like to bring more peace into your home."
  },
  {
    "anchor": "Your home remembers your laughter and tears.",
    "prompt": "Think of a time your home held you through emotion.",
    "example": "crying safely, celebrating alone, feeling gratitude quietly.",
    "gratitude_example": "I'm grateful for the walls that held me through both joy and pain.",
    "pause_cue": "Let tenderness replace judgment for all those memories.",
    "placeholder": "Write gratitude for the way your home holds your emotions."
  },
  {
    "anchor": "Home is where gratitude grows easiest.",
    "prompt": "Think of how your home supports your daily well-being.",
    "example": "comfort, privacy, peace, familiarity.",
    "gratitude_example": "I'm grateful for the shelter that allows me to rest, heal, and dream.",
    "pause_cue": "Let thankfulness expand within your walls.",
    "placeholder": "Write what part of home you’re most thankful for today."
  },
  {
    "anchor": "Soft light and silence are blessings too.",
    "prompt": "Think of a time your home’s quiet brought you clarity or peace.",
    "example": "morning silence, calm evening, no noise at all.",
    "gratitude_example": "I'm grateful for the silence that speaks peace into my heart.",
    "pause_cue": "Let your awareness rest in that remembered stillness.",
    "placeholder": "Write gratitude for the quiet spaces in your home."
  },
  {
    "anchor": "Your home’s heart beats through its moments of care.",
    "prompt": "Think of a routine that keeps your home feeling alive.",
    "example": "watering plants, opening windows, cleaning, lighting incense.",
    "gratitude_example": "I'm grateful for the rituals that keep my home feeling fresh and loved.",
    "pause_cue": "Let that sense of care ripple inward.",
    "placeholder": "Write what ritual of care you appreciate most."
  },
  {
    "anchor": "Comfort is love made visible.",
    "prompt": "Think of something in your home that gives you instant comfort.",
    "example": "a blanket, music, chair, light, texture, pet.",
    "gratitude_example": "I'm grateful for the small comforts that bring me back to peace.",
    "pause_cue": "Let comfort feel tangible for a moment.",
    "placeholder": "Write what comfort in your home you’re thankful for."
  },
  {
    "anchor": "Home gives your soul a place to land.",
    "prompt": "Think of what makes you feel truly yourself within your home.",
    "example": "clothes you wear, how you rest, what you keep around you.",
    "gratitude_example": "I'm grateful for having a space where I can just be.",
    "pause_cue": "Let gratitude feel like arriving.",
    "placeholder": "Write what part of being home feels most like you."
  }
],
  ),
  
  GratitudeCategory(
    categoryName: "Nature & Environment",
    emoji: "💞",
    items: [
  {
    "anchor": "The earth keeps breathing beneath your feet.",
    "prompt": "Think of a natural place or moment that recently brought you calm.",
    "example": "a walk in the park, sunlight through leaves, rain on the window.",
    "gratitude_example": "I'm grateful for how nature steadies me when life feels fast.",
    "pause_cue": "Let that image fill your mind like a gentle breath.",
    "placeholder": "Write what natural moment you’re thankful for today."
  },
  {
    "anchor": "The sky changes — and so can you.",
    "prompt": "Recall a time you paused to look at the sky.",
    "example": "sunrise colors, drifting clouds, stars at night.",
    "gratitude_example": "I'm grateful for the reminder that every sky, like every day, begins again.",
    "pause_cue": "Let renewal feel light in your chest.",
    "placeholder": "Write gratitude for that simple, vast beauty."
  },
  {
    "anchor": "Water teaches flow and renewal.",
    "prompt": "Think of how water appears in your life with comfort or peace.",
    "example": "showers, oceans, rivers, rain, drinking water.",
    "gratitude_example": "I'm grateful for water’s calm persistence — always moving, always cleansing.",
    "pause_cue": "Imagine that flow washing through you.",
    "placeholder": "Write what moment with water you’re thankful for."
  },
  {
    "anchor": "The earth offers without asking anything back.",
    "prompt": "Think of something in nature you benefit from every day.",
    "example": "sunlight, trees, food, air, shade.",
    "gratitude_example": "I'm grateful for the generosity of the earth that sustains me daily.",
    "pause_cue": "Let appreciation for life’s quiet gifts rise naturally.",
    "placeholder": "Write what part of nature you want to thank."
  },
  {
    "anchor": "Wind reminds us to let go.",
    "prompt": "Recall a moment you felt or heard the wind.",
    "example": "rustling leaves, breeze on your skin, open window air.",
    "gratitude_example": "I'm grateful for the wind that clears my mind and refreshes my spirit.",
    "pause_cue": "Exhale like the breeze passing by.",
    "placeholder": "Write what you appreciate about that airy reminder."
  },
  {
    "anchor": "Sunlight is warmth you can feel without owning.",
    "prompt": "Think of a recent moment you felt sunlight on your skin.",
    "example": "morning walk, sitting near a window, summer day.",
    "gratitude_example": "I'm grateful for the sun that greets me without fail.",
    "pause_cue": "Let that warmth soak through your memory again.",
    "placeholder": "Write gratitude for the light that touches your days."
  },
  {
    "anchor": "Trees stand tall and teach patience.",
    "prompt": "Think of a tree that feels familiar or comforting to you.",
    "example": "one near your home, from childhood, or in a favorite place.",
    "gratitude_example": "I'm grateful for the quiet wisdom trees hold in their stillness.",
    "pause_cue": "Imagine grounding through your own roots for a breath.",
    "placeholder": "Write what you admire or thank about trees."
  },
  {
    "anchor": "The moon reminds us that light returns.",
    "prompt": "Recall a night you looked up at the moon or stars.",
    "example": "noticing brightness, feeling peace, sharing the view with someone.",
    "gratitude_example": "I'm grateful for the sky’s gentle reassurance that light always comes back.",
    "pause_cue": "Let calm settle like moonlight in still water.",
    "placeholder": "Write gratitude for that moment under the sky."
  },
  {
    "anchor": "Nature asks only that you notice.",
    "prompt": "Think of a tiny natural detail that caught your eye today.",
    "example": "a bird’s sound, a leaf’s shape, the scent of air.",
    "gratitude_example": "I'm grateful for how small wonders remind me I’m part of something vast.",
    "pause_cue": "Let observation become reverence.",
    "placeholder": "Write what small detail of nature you’re thankful for."
  },
  {
    "anchor": "Even storms have beauty.",
    "prompt": "Think of a time you found peace or awe in wild weather.",
    "example": "rainstorm, thunder, snowfall, heavy wind.",
    "gratitude_example": "I'm grateful for nature’s reminder that power and peace coexist.",
    "pause_cue": "Let that wildness mirror your own inner strength.",
    "placeholder": "Write what moment of nature’s power you’re thankful for."
  },
  {
    "anchor": "Earth’s rhythm mirrors your own heartbeat.",
    "prompt": "Notice how nature’s pace differs from the world’s rush.",
    "example": "sunrise pace, tide cycles, slow growth of plants.",
    "gratitude_example": "I'm grateful for the steady rhythm that keeps life balanced.",
    "pause_cue": "Breathe in sync with that slower pulse.",
    "placeholder": "Write what you appreciate about nature’s calm pace."
  },
  {
    "anchor": "Every flower blooms in its own season.",
    "prompt": "Think of something in nature that reminds you to be patient.",
    "example": "buds opening, seasons changing, fruit ripening.",
    "gratitude_example": "I'm grateful for nature’s reminder that growth takes time.",
    "pause_cue": "Let patience feel natural, not forced.",
    "placeholder": "Write what you’re thankful for learning from the seasons."
  },
  {
    "anchor": "Mountains teach strength through stillness.",
    "prompt": "Recall a place or image of mountains that made you feel awe.",
    "example": "a photo, hike, or distant view.",
    "gratitude_example": "I'm grateful for the grounded strength nature reflects back to me.",
    "pause_cue": "Let that steadiness settle into your body.",
    "placeholder": "Write gratitude for nature’s calm strength."
  },
  {
    "anchor": "Morning light is a daily invitation.",
    "prompt": "Think of the first light of day and what it brings you.",
    "example": "warmth, new energy, quiet reflection.",
    "gratitude_example": "I'm grateful for mornings that remind me of new chances.",
    "pause_cue": "Let that soft light fill your awareness.",
    "placeholder": "Write what you’re thankful for about the start of a new day."
  },
  {
    "anchor": "Nature never hurries, yet everything unfolds.",
    "prompt": "Think of something in your life that’s growing slowly, like in nature.",
    "example": "a goal, healing, relationship, self-understanding.",
    "gratitude_example": "I'm grateful for learning from nature’s steady unfolding.",
    "pause_cue": "Let patience feel like peace, not waiting.",
    "placeholder": "Write gratitude for something growing at its own pace."
  },
  {
    "anchor": "Birdsong reminds us of freedom.",
    "prompt": "Think of hearing birds or other natural sounds recently.",
    "example": "chirping, rustling leaves, flowing water.",
    "gratitude_example": "I'm grateful for nature’s sounds that bring my mind back to the present.",
    "pause_cue": "Listen inwardly for that calm melody.",
    "placeholder": "Write what sound of nature you’re thankful for."
  },
  {
    "anchor": "Even shadows prove light exists.",
    "prompt": "Think of how sunlight and shade create balance around you.",
    "example": "walking under trees, sitting in cool shade, golden hour glow.",
    "gratitude_example": "I'm grateful for the harmony of contrast in nature — and in me.",
    "pause_cue": "Let duality feel natural, not opposing.",
    "placeholder": "Write gratitude for both light and shade in life."
  },
  {
    "anchor": "The soil beneath you is alive with generosity.",
    "prompt": "Think of how the earth gives without being asked.",
    "example": "fruits, plants, shelter, nourishment.",
    "gratitude_example": "I'm grateful for the abundance that rises quietly from the ground.",
    "pause_cue": "Let humility meet gratitude in your chest.",
    "placeholder": "Write what natural abundance you’re thankful for."
  },
  {
    "anchor": "Nature keeps teaching balance.",
    "prompt": "Think of how ecosystems depend on give and take.",
    "example": "bees and flowers, tides and moon, sunlight and rain.",
    "gratitude_example": "I'm grateful for nature’s wisdom in cooperation and balance.",
    "pause_cue": "Let that sense of balance remind you of harmony within.",
    "placeholder": "Write gratitude for the balance you see in the natural world."
  },
  {
    "anchor": "Rain reminds us that cleansing can be gentle.",
    "prompt": "Recall the feeling or sound of rain that brought peace.",
    "example": "drizzle on windows, earthy scent, quiet rhythm.",
    "gratitude_example": "I'm grateful for rain’s reminder that renewal doesn’t need noise.",
    "pause_cue": "Imagine the sound softening your thoughts.",
    "placeholder": "Write what rainy moment you’re thankful for."
  },
  {
    "anchor": "Nature’s beauty asks for awe, not ownership.",
    "prompt": "Think of a natural wonder that humbled you.",
    "example": "ocean vastness, desert silence, forest depth.",
    "gratitude_example": "I'm grateful for the humility nature teaches through its greatness.",
    "pause_cue": "Let awe expand your breath.",
    "placeholder": "Write gratitude for a moment nature made you feel small in a good way."
  },
  {
    "anchor": "The seasons remind us that change is safe.",
    "prompt": "Think of your favorite season and what it represents.",
    "example": "spring renewal, summer joy, autumn reflection, winter rest.",
    "gratitude_example": "I'm grateful for the cycles that keep life dynamic and alive.",
    "pause_cue": "Let change feel like continuity, not loss.",
    "placeholder": "Write what season you’re thankful for and why."
  },
  {
    "anchor": "Nature heals without hurry.",
    "prompt": "Think of a time being outdoors made you feel lighter.",
    "example": "walking barefoot, sitting in sunlight, touching plants.",
    "gratitude_example": "I'm grateful for nature’s ability to heal what words can’t reach.",
    "pause_cue": "Let that healing memory soothe you again.",
    "placeholder": "Write gratitude for nature’s quiet medicine."
  },
  {
    "anchor": "Every sunrise is an unearned gift.",
    "prompt": "Think of a morning when nature’s beauty stopped you for a second.",
    "example": "pink sky, golden light, morning calm.",
    "gratitude_example": "I'm grateful for the reminder that beauty arrives freely, every day.",
    "pause_cue": "Let gratitude rise with that imagined sun.",
    "placeholder": "Write what natural gift greeted you today."
  },
  {
    "anchor": "You belong to the earth, not apart from it.",
    "prompt": "Think of how you’re connected to nature through the elements.",
    "example": "breath as air, body as earth, warmth as fire, emotions as water.",
    "gratitude_example": "I'm grateful for remembering that I’m part of everything that lives.",
    "pause_cue": "Feel connection instead of separation.",
    "placeholder": "Write gratitude for being part of nature itself."
  }
],
  ),
  
  GratitudeCategory(
    categoryName: "The World & Humanity",
    emoji: "💞",
    items: [
  {
    "anchor": "The world keeps turning, carrying all of us together.",
    "prompt": "Think of something in the world that gives you hope right now.",
    "example": "acts of kindness, innovation, art, resilience of people.",
    "gratitude_example": "I'm grateful for the quiet goodness that still exists everywhere.",
    "pause_cue": "Let hope feel steady, not fleeting.",
    "placeholder": "Write what in the world reminds you that good continues."
  },
  {
    "anchor": "Humanity is imperfect, yet endlessly creative.",
    "prompt": "Think of a human achievement that fills you with awe or pride.",
    "example": "music, medicine, technology, compassion projects.",
    "gratitude_example": "I'm grateful for the brilliance and creativity humanity keeps showing.",
    "pause_cue": "Let admiration turn into appreciation.",
    "placeholder": "Write what collective creation you’re thankful for."
  },
  {
    "anchor": "Kindness connects strangers across the globe.",
    "prompt": "Recall a time someone you didn’t know helped or touched you.",
    "example": "a smile, small favor, comforting word online or in person.",
    "gratitude_example": "I'm grateful for the kindness of people I’ve never met.",
    "pause_cue": "Feel connection beyond distance or difference.",
    "placeholder": "Write what small act of humanity you’re thankful for."
  },
  {
    "anchor": "We all share one sky.",
    "prompt": "Think of a moment you realized someone far away sees the same sky.",
    "example": "traveling, writing to someone, watching sunset together apart.",
    "gratitude_example": "I'm grateful for the reminder that separation is mostly illusion.",
    "pause_cue": "Let unity feel as vast as the horizon.",
    "placeholder": "Write gratitude for feeling connected to people everywhere."
  },
  {
    "anchor": "The world heals slowly, like we do.",
    "prompt": "Think of a global or local change that gives you faith in progress.",
    "example": "environmental efforts, equality movements, community rebuilding.",
    "gratitude_example": "I'm grateful for people who keep trying to make the world better.",
    "pause_cue": "Let hope feel active, not distant.",
    "placeholder": "Write what movement or progress you’re grateful for."
  },
  {
    "anchor": "People everywhere share the same basic dreams.",
    "prompt": "Think of something all humans want that connects us deeply.",
    "example": "safety, love, belonging, peace.",
    "gratitude_example": "I'm grateful for remembering how similar we really are.",
    "pause_cue": "Let compassion soften judgment.",
    "placeholder": "Write gratitude for our shared human hopes."
  },
  {
    "anchor": "Art proves that beauty is universal.",
    "prompt": "Recall a song, painting, or film that moved you deeply.",
    "example": "music that comforts, story that inspired empathy.",
    "gratitude_example": "I'm grateful for art that reminds me of our shared emotions.",
    "pause_cue": "Let beauty reconnect you with the human story.",
    "placeholder": "Write what creative work you’re thankful for."
  },
  {
    "anchor": "Compassion is the quiet language of humanity.",
    "prompt": "Think of a moment you witnessed or practiced compassion.",
    "example": "comforting someone, donating, forgiving, listening.",
    "gratitude_example": "I'm grateful for the empathy that still threads through our world.",
    "pause_cue": "Let compassion feel like strength, not softness.",
    "placeholder": "Write what act of compassion you’re thankful for."
  },
  {
    "anchor": "The world keeps offering second chances.",
    "prompt": "Think of a collective crisis that led to collective learning.",
    "example": "rebuilding after disaster, global cooperation, shared awareness.",
    "gratitude_example": "I'm grateful for humanity’s ability to learn and adapt.",
    "pause_cue": "Let renewal feel like responsibility and hope intertwined.",
    "placeholder": "Write gratitude for what the world has learned together."
  },
  {
    "anchor": "Strangers become stories that change us.",
    "prompt": "Think of a story you read or heard that touched your heart.",
    "example": "someone’s courage, resilience, kindness, loss.",
    "gratitude_example": "I'm grateful for stories that remind me of human strength and tenderness.",
    "pause_cue": "Let those emotions expand your empathy.",
    "placeholder": "Write what human story you’re thankful for hearing."
  },
  {
    "anchor": "Human progress is a collection of small kindnesses.",
    "prompt": "Think of ordinary people doing extraordinary things quietly.",
    "example": "teachers, caregivers, volunteers, neighbors.",
    "gratitude_example": "I'm grateful for the everyday heroes who keep the world compassionate.",
    "pause_cue": "Let appreciation ripple outward to unseen helpers.",
    "placeholder": "Write what everyday kindness you’re thankful for today."
  },
  {
    "anchor": "We rise by lifting each other.",
    "prompt": "Think of a community or collective that inspires you.",
    "example": "local volunteers, global charities, creative collaborations.",
    "gratitude_example": "I'm grateful for communities that remind me we’re stronger together.",
    "pause_cue": "Let gratitude connect you to collective strength.",
    "placeholder": "Write what community effort you appreciate most."
  },
  {
    "anchor": "Hope is humanity’s oldest habit.",
    "prompt": "Think of a time people didn’t give up — and things got better.",
    "example": "breakthroughs, reconciliation, recovery.",
    "gratitude_example": "I'm grateful for humanity’s endless ability to start again.",
    "pause_cue": "Let resilience feel like shared courage.",
    "placeholder": "Write gratitude for an example of hope that moved you."
  },
  {
    "anchor": "Connection is the antidote to fear.",
    "prompt": "Think of a moment you felt supported by the world around you.",
    "example": "kindness from friends, strangers, or global community.",
    "gratitude_example": "I'm grateful for the web of connection that keeps me from isolation.",
    "pause_cue": "Feel how belonging stretches beyond borders.",
    "placeholder": "Write what human connection you’re thankful for."
  },
  {
    "anchor": "Languages differ, feelings don’t.",
    "prompt": "Think of how love, laughter, or music transcend translation.",
    "example": "a smile, shared rhythm, universal emotion.",
    "gratitude_example": "I'm grateful for the emotions that make us one species, not many.",
    "pause_cue": "Let unity feel simple and true.",
    "placeholder": "Write what shared feeling makes you grateful to be human."
  },
  {
    "anchor": "The world gives, and we give back.",
    "prompt": "Think of a cause or effort you care about supporting.",
    "example": "helping others, protecting the planet, educating, healing.",
    "gratitude_example": "I'm grateful for being part of a world where I can contribute meaningfully.",
    "pause_cue": "Let responsibility feel like love in action.",
    "placeholder": "Write what you’re thankful to give back to."
  },
  {
    "anchor": "We build tomorrow by how we care today.",
    "prompt": "Think of a gesture or choice that helps future generations.",
    "example": "recycling, teaching, raising awareness, planting trees.",
    "gratitude_example": "I'm grateful for the chance to help shape a kinder future.",
    "pause_cue": "Let that purpose feel steady, not heavy.",
    "placeholder": "Write gratitude for what future action you feel proud of."
  },
  {
    "anchor": "Even in chaos, people find ways to love.",
    "prompt": "Think of times humanity showed unity during crisis.",
    "example": "communities helping, global aid, resilience after tragedy.",
    "gratitude_example": "I'm grateful for love’s persistence even in the hardest moments.",
    "pause_cue": "Let faith in humanity feel renewed.",
    "placeholder": "Write what act of unity you’re thankful for."
  },
  {
    "anchor": "Curiosity keeps the world evolving.",
    "prompt": "Think of something new you’ve learned from someone recently.",
    "example": "idea exchange, cultural insight, new perspective.",
    "gratitude_example": "I'm grateful for the curiosity that keeps us all learning and growing.",
    "pause_cue": "Let wonder replace certainty for a moment.",
    "placeholder": "Write what shared knowledge you’re grateful for."
  },
  {
    "anchor": "We are all stories the earth is telling.",
    "prompt": "Think of how humans shape and are shaped by this planet.",
    "example": "building, writing, farming, dreaming.",
    "gratitude_example": "I'm grateful to be part of the living story of the world.",
    "pause_cue": "Let belonging feel vast and gentle.",
    "placeholder": "Write gratitude for being part of life’s shared narrative."
  },
  {
    "anchor": "Peace begins in small circles.",
    "prompt": "Think of one relationship or community where peace has grown.",
    "example": "reconciliation, understanding, kindness spreading.",
    "gratitude_example": "I'm grateful for the peace I witness close to home.",
    "pause_cue": "Let peace feel possible everywhere, starting here.",
    "placeholder": "Write what moment of peace you’re thankful for."
  },
  {
    "anchor": "Progress is built on collective courage.",
    "prompt": "Think of people who take risks to improve life for others.",
    "example": "activists, healthcare workers, scientists, artists.",
    "gratitude_example": "I'm grateful for the courage that keeps the world moving forward.",
    "pause_cue": "Let admiration spark gratitude, not comparison.",
    "placeholder": "Write what brave contribution inspires your thanks."
  },
  {
    "anchor": "Love is the world’s most renewable resource.",
    "prompt": "Think of a gesture of love that traveled far beyond its origin.",
    "example": "kindness chain, generosity, comfort spreading.",
    "gratitude_example": "I'm grateful that love never runs out the more it’s shared.",
    "pause_cue": "Let expansion feel infinite, not exhausting.",
    "placeholder": "Write gratitude for how love spreads around you."
  },
  {
    "anchor": "The world is still full of helpers.",
    "prompt": "Think of someone who dedicates their life to helping others.",
    "example": "doctors, teachers, volunteers, neighbors, caregivers.",
    "gratitude_example": "I'm grateful for the people who make compassion their daily work.",
    "pause_cue": "Let trust in humanity feel restored.",
    "placeholder": "Write what kind of helpers you’re thankful for."
  },
  {
    "anchor": "The human spirit adapts endlessly.",
    "prompt": "Think of a group or culture that thrives despite hardship.",
    "example": "rebuilding, preserving art, keeping joy alive.",
    "gratitude_example": "I'm grateful for resilience that proves hope can’t be erased.",
    "pause_cue": "Let gratitude feel global and grounded.",
    "placeholder": "Write what example of endurance you’re thankful for."
  },
  {
    "anchor": "Gratitude makes the world feel smaller and kinder.",
    "prompt": "Think of a way your appreciation connects you to others.",
    "example": "saying thank you, giving credit, paying forward kindness.",
    "gratitude_example": "I'm grateful for how gratitude itself builds bridges between people.",
    "pause_cue": "Let appreciation feel contagious.",
    "placeholder": "Write what thankfulness has helped you connect to recently."
  }
],
  ),
  
  GratitudeCategory(
    categoryName: "Money & Stability",
    emoji: "💞",
    items: [
  {
    "anchor": "Security begins with appreciation, not accumulation.",
    "prompt": "Think of one way money has supported your peace recently.",
    "example": "paying bills, buying food, having a roof, small comfort purchase.",
    "gratitude_example": "I'm grateful for the stability that allows me to live with ease.",
    "pause_cue": "Let sufficiency feel enough for now.",
    "placeholder": "Write what financial support or stability you’re thankful for."
  },
  {
    "anchor": "Wealth is energy in motion.",
    "prompt": "Think of a time you used money in a way that felt aligned with your values.",
    "example": "helping someone, investing in growth, supporting a cause.",
    "gratitude_example": "I'm grateful for being able to use my resources with intention and care.",
    "pause_cue": "Let alignment feel richer than possession.",
    "placeholder": "Write what mindful use of money you’re grateful for."
  },
  {
    "anchor": "Money can serve, not rule.",
    "prompt": "Think of a moment you made a choice based on peace, not pressure.",
    "example": "turning down a draining job, saving slowly, avoiding comparison.",
    "gratitude_example": "I'm grateful for the freedom to make choices that honor my values.",
    "pause_cue": "Let peace replace the chase.",
    "placeholder": "Write gratitude for a money-related decision that felt true to you."
  },
  {
    "anchor": "Gratitude turns enough into abundance.",
    "prompt": "Think of something small you could afford that made life sweeter.",
    "example": "a coffee, candle, bus ticket, cozy meal.",
    "gratitude_example": "I'm grateful for the small things money helps me enjoy.",
    "pause_cue": "Let contentment feel luxurious.",
    "placeholder": "Write what small joy your money allowed you to experience."
  },
  {
    "anchor": "True wealth is the absence of worry.",
    "prompt": "Think of a bill or need that was taken care of recently.",
    "example": "rent paid, groceries covered, debt reduced.",
    "gratitude_example": "I'm grateful for the relief that comes with meeting my needs.",
    "pause_cue": "Let security feel simple, not distant.",
    "placeholder": "Write what financial ease you’re thankful for right now."
  },
  {
    "anchor": "Money reflects trust — in yourself and in life.",
    "prompt": "Think of a time you trusted your ability to earn or manage money.",
    "example": "saving gradually, starting something new, learning budgeting.",
    "gratitude_example": "I'm grateful for the trust I’m building in my ability to provide for myself.",
    "pause_cue": "Let that self-trust feel steady.",
    "placeholder": "Write what part of financial self-trust you appreciate most."
  },
  {
    "anchor": "You already have enough to feel grateful.",
    "prompt": "Think of what financial blessings you often overlook.",
    "example": "regular income, food, shelter, clothes, internet.",
    "gratitude_example": "I'm grateful for the foundation that supports my everyday life.",
    "pause_cue": "Let gratitude dissolve comparison.",
    "placeholder": "Write what daily financial comforts you’re thankful for."
  },
  {
    "anchor": "Resources grow where attention flows.",
    "prompt": "Think of how caring for your money has helped you feel calmer.",
    "example": "planning, saving, tracking spending, learning awareness.",
    "gratitude_example": "I'm grateful for the clarity that mindful money habits bring.",
    "pause_cue": "Let awareness feel empowering, not restricting.",
    "placeholder": "Write gratitude for how awareness has improved your relationship with money."
  },
  {
    "anchor": "Money is a tool, not an identity.",
    "prompt": "Think of what makes you valuable beyond your finances.",
    "example": "kindness, effort, creativity, resilience.",
    "gratitude_example": "I'm grateful for remembering my worth isn’t measured in currency.",
    "pause_cue": "Let self-worth feel unshakable.",
    "placeholder": "Write gratitude for what makes you rich beyond money."
  },
  {
    "anchor": "Abundance begins with enough.",
    "prompt": "Think of something you have right now that meets your need fully.",
    "example": "warm bed, meal, warm clothing, safety.",
    "gratitude_example": "I'm grateful for having enough, and for knowing it.",
    "pause_cue": "Let sufficiency settle like calm in your heart.",
    "placeholder": "Write what simple ‘enough’ you’re grateful for today."
  },
  {
    "anchor": "Generosity multiplies abundance.",
    "prompt": "Think of a time you gave or shared money or help.",
    "example": "gift, donation, treating a friend, small gesture.",
    "gratitude_example": "I'm grateful for the joy of giving, no matter the amount.",
    "pause_cue": "Let generosity feel like expansion, not loss.",
    "placeholder": "Write gratitude for what giving has given you back."
  },
  {
    "anchor": "Earning is also an act of self-respect.",
    "prompt": "Think of the effort you put into creating income.",
    "example": "showing up at work, freelancing, learning, persistence.",
    "gratitude_example": "I'm grateful for the effort that brings both money and meaning.",
    "pause_cue": "Let pride and humility coexist peacefully.",
    "placeholder": "Write gratitude for the work that sustains your life."
  },
  {
    "anchor": "Financial peace grows from inner calm.",
    "prompt": "Think of a time you handled money with clarity instead of fear.",
    "example": "planning ahead, asking for help, setting boundaries.",
    "gratitude_example": "I'm grateful for finding calm within the topic that once brought stress.",
    "pause_cue": "Let calm feel like control rooted in trust.",
    "placeholder": "Write what financial peace means to you now."
  },
  {
    "anchor": "Money is part of life’s flow, not life’s goal.",
    "prompt": "Think of what brings joy that costs nothing.",
    "example": "laughter, nature, love, rest, gratitude.",
    "gratitude_example": "I'm grateful for the wealth that doesn’t need a price tag.",
    "pause_cue": "Let simplicity feel abundant.",
    "placeholder": "Write what non-monetary riches you’re thankful for."
  },
  {
    "anchor": "Financial freedom starts with awareness.",
    "prompt": "Think of what you’ve learned about money over the years.",
    "example": "lessons from mistakes, wiser spending, new patience.",
    "gratitude_example": "I'm grateful for how my understanding of money keeps growing.",
    "pause_cue": "Let learning feel liberating, not shameful.",
    "placeholder": "Write gratitude for what money has taught you."
  },
  {
    "anchor": "Saving is self-care in future form.",
    "prompt": "Think of something you’ve saved for that gave you peace of mind.",
    "example": "emergency fund, travel, investment, small goal.",
    "gratitude_example": "I'm grateful for the security my past self created for me.",
    "pause_cue": "Let future-you feel cared for in advance.",
    "placeholder": "Write gratitude for what saving has made possible."
  },
  {
    "anchor": "Contentment costs nothing.",
    "prompt": "Think of something you already own that still brings joy.",
    "example": "favorite mug, old shoes, gift, cozy blanket.",
    "gratitude_example": "I'm grateful for how joy can live in what I already have.",
    "pause_cue": "Let stillness feel abundant.",
    "placeholder": "Write what possession or item you’re still thankful for."
  },
  {
    "anchor": "Money can fund memories, not just needs.",
    "prompt": "Think of an experience your money helped create.",
    "example": "trip, meal, concert, day out, shared moment.",
    "gratitude_example": "I'm grateful for the experiences my money helped make possible.",
    "pause_cue": "Let memory feel like the best investment.",
    "placeholder": "Write gratitude for one experience your spending brought you."
  },
  {
    "anchor": "Wealth grows through appreciation, not fear.",
    "prompt": "Think of a financial worry that worked out better than you feared.",
    "example": "a bill paid, support received, solution found.",
    "gratitude_example": "I'm grateful for realizing that fear often exaggerates lack.",
    "pause_cue": "Let faith replace fear gently.",
    "placeholder": "Write what money worry resolved in your favor."
  },
  {
    "anchor": "Financial gratitude brings perspective.",
    "prompt": "Think of how your situation compares to what you once dreamed of.",
    "example": "past hardships, small wins, new freedoms.",
    "gratitude_example": "I'm grateful for how far I’ve come financially and emotionally.",
    "pause_cue": "Let progress feel visible for a moment.",
    "placeholder": "Write gratitude for the journey your finances have taken."
  },
  {
    "anchor": "Money spent on joy is never wasted.",
    "prompt": "Think of something you spent on that truly uplifted you.",
    "example": "self-care, creativity, health, time off.",
    "gratitude_example": "I'm grateful for every purchase that supported my well-being.",
    "pause_cue": "Let joy feel worth its value.",
    "placeholder": "Write what joyful expense you’re thankful for."
  },
  {
    "anchor": "Prosperity begins in the mind.",
    "prompt": "Think of a time you felt rich in possibility, not just currency.",
    "example": "new opportunity, creativity, learning moment.",
    "gratitude_example": "I'm grateful for the mental abundance that leads to real change.",
    "pause_cue": "Let thoughts of possibility expand quietly.",
    "placeholder": "Write gratitude for the mindset that attracts abundance."
  },
  {
    "anchor": "Money flows more easily when shared freely.",
    "prompt": "Think of an exchange that brought joy to both sides.",
    "example": "gift, fair trade, tip, collaboration.",
    "gratitude_example": "I'm grateful for exchanges that remind me money can spread happiness.",
    "pause_cue": "Let generosity feel circular, not linear.",
    "placeholder": "Write what mutual generosity you’re thankful for."
  },
  {
    "anchor": "Financial growth mirrors self-growth.",
    "prompt": "Think of how your financial habits evolved over time.",
    "example": "learning restraint, gaining confidence, letting go of guilt.",
    "gratitude_example": "I'm grateful for becoming wiser and calmer about money.",
    "pause_cue": "Let maturity feel abundant.",
    "placeholder": "Write what lesson about money you’re most thankful for."
  },
  {
    "anchor": "Peace with money is peace with life.",
    "prompt": "Think of how financial security affects your overall well-being.",
    "example": "better rest, freedom to create, time for loved ones.",
    "gratitude_example": "I'm grateful for the financial calm that lets me focus on what matters most.",
    "pause_cue": "Let gratitude for stability deepen your breath.",
    "placeholder": "Write what peace money allows you to experience."
  }
],

  ),
  
  GratitudeCategory(
    categoryName: "Learning & Growth",
    emoji: "💞",
    items: [
  {
    "anchor": "Growth rarely feels graceful while it’s happening.",
    "prompt": "Think of a time you learned something the hard way but came out wiser.",
    "example": "failure, rejection, misstep, difficult feedback.",
    "gratitude_example": "I'm grateful for the lessons that shaped my strength through struggle.",
    "pause_cue": "Let wisdom feel worth the journey.",
    "placeholder": "Write what challenge became your teacher."
  },
  {
    "anchor": "Every mistake hides a map forward.",
    "prompt": "Think of a mistake that helped you improve or redirect.",
    "example": "wrong turn, missed opportunity, misunderstanding.",
    "gratitude_example": "I'm grateful for the mistakes that guided me toward clarity.",
    "pause_cue": "Let acceptance replace regret.",
    "placeholder": "Write gratitude for what failure taught you."
  },
  {
    "anchor": "Curiosity keeps your soul young.",
    "prompt": "Think of something new you learned recently that excited you.",
    "example": "a concept, skill, culture, idea, or hobby.",
    "gratitude_example": "I'm grateful for the curiosity that keeps life fresh and alive.",
    "pause_cue": "Let wonder feel like energy.",
    "placeholder": "Write gratitude for something new you’ve learned."
  },
  {
    "anchor": "Patience is the companion of progress.",
    "prompt": "Think of something that took time to understand or master.",
    "example": "language, relationship, career, inner peace.",
    "gratitude_example": "I'm grateful for the patience that turned confusion into growth.",
    "pause_cue": "Let time feel like an ally, not an enemy.",
    "placeholder": "Write gratitude for what slow growth taught you."
  },
  {
    "anchor": "Every day is a small classroom.",
    "prompt": "Think of a lesson you learned from daily life, not books.",
    "example": "from a conversation, mistake, or observation.",
    "gratitude_example": "I'm grateful for how ordinary moments keep teaching me.",
    "pause_cue": "Let awareness feel like learning in motion.",
    "placeholder": "Write what everyday lesson you’re thankful for."
  },
  {
    "anchor": "Growth is proof of change well received.",
    "prompt": "Think of how you’ve changed for the better over the past year.",
    "example": "calmer reactions, wiser choices, new strength.",
    "gratitude_example": "I'm grateful for the person I’ve become through steady growth.",
    "pause_cue": "Let gratitude honor your evolution.",
    "placeholder": "Write what change in yourself you’re thankful for."
  },
  {
    "anchor": "Lessons repeat until we listen.",
    "prompt": "Think of a recurring challenge that finally made sense.",
    "example": "same type of mistake, pattern, or emotion.",
    "gratitude_example": "I'm grateful for life’s persistence in helping me understand what I need.",
    "pause_cue": "Let humility feel like openness.",
    "placeholder": "Write what lesson life keeps reminding you of."
  },
  {
    "anchor": "Curiosity turns confusion into discovery.",
    "prompt": "Think of a question that led you somewhere new.",
    "example": "researching, exploring, asking why, seeking meaning.",
    "gratitude_example": "I'm grateful for questions that expand my understanding.",
    "pause_cue": "Let curiosity feel like freedom.",
    "placeholder": "Write gratitude for a question that shaped your growth."
  },
  {
    "anchor": "Growth requires both roots and wings.",
    "prompt": "Think of something that grounds you while you keep learning.",
    "example": "values, family, friends, habits.",
    "gratitude_example": "I'm grateful for the balance between stability and exploration.",
    "pause_cue": "Let balance feel like maturity.",
    "placeholder": "Write gratitude for what keeps you grounded as you grow."
  },
  {
    "anchor": "Learning is a lifelong friendship with curiosity.",
    "prompt": "Think of a skill or topic you want to keep improving in.",
    "example": "music, communication, cooking, empathy.",
    "gratitude_example": "I'm grateful for the endless room to learn and evolve.",
    "pause_cue": "Let enthusiasm replace pressure.",
    "placeholder": "Write what area of growth excites you most."
  },
  {
    "anchor": "Wisdom grows when ego shrinks.",
    "prompt": "Think of a time you accepted you didn’t know everything.",
    "example": "asking for help, admitting mistake, learning from others.",
    "gratitude_example": "I'm grateful for humility — it keeps my mind open.",
    "pause_cue": "Let humility feel freeing, not small.",
    "placeholder": "Write what surrender to learning taught you."
  },
  {
    "anchor": "Teachers come disguised as people and moments.",
    "prompt": "Think of someone who unintentionally taught you something important.",
    "example": "mentor, child, stranger, critic, friend.",
    "gratitude_example": "I'm grateful for everyone who’s been part of my learning journey.",
    "pause_cue": "Let appreciation soften into reflection.",
    "placeholder": "Write gratitude for a person who taught you something meaningful."
  },
  {
    "anchor": "Failure refines character like fire refines gold.",
    "prompt": "Think of a tough experience that strengthened your resilience.",
    "example": "rejection, mistake, delay, change of plans.",
    "gratitude_example": "I'm grateful for the fires that forged me stronger and softer.",
    "pause_cue": "Let resilience feel noble, not forced.",
    "placeholder": "Write what challenge shaped your growth."
  },
  {
    "anchor": "Awareness is the seed of change.",
    "prompt": "Think of a recent realization that shifted your mindset.",
    "example": "noticing patterns, understanding emotions, seeing clearly.",
    "gratitude_example": "I'm grateful for awareness that keeps me evolving with grace.",
    "pause_cue": "Let clarity feel like a gentle light.",
    "placeholder": "Write gratitude for a new realization you’ve had."
  },
  {
    "anchor": "Growth can be invisible but real.",
    "prompt": "Think of something inside you that’s quietly improving.",
    "example": "patience, kindness, confidence, balance.",
    "gratitude_example": "I'm grateful for progress that doesn’t need to be seen to be true.",
    "pause_cue": "Let invisible effort feel acknowledged.",
    "placeholder": "Write what inner growth you’re thankful for."
  },
  {
    "anchor": "Reflection turns experience into understanding.",
    "prompt": "Think of what the past week taught you, big or small.",
    "example": "a conversation, feeling, challenge, success.",
    "gratitude_example": "I'm grateful for learning that happens even without intention.",
    "pause_cue": "Let reflection feel restful, not analytical.",
    "placeholder": "Write gratitude for what life taught you recently."
  },
  {
    "anchor": "Progress is the sum of small efforts repeated.",
    "prompt": "Think of a habit or practice that’s paying off slowly.",
    "example": "meditation, exercise, reading, patience.",
    "gratitude_example": "I'm grateful for the consistency that makes growth possible.",
    "pause_cue": "Let discipline feel like devotion.",
    "placeholder": "Write gratitude for what persistence is building in your life."
  },
  {
    "anchor": "Wisdom grows best in humble soil.",
    "prompt": "Think of a time you were wrong and grew because of it.",
    "example": "changing your opinion, forgiving yourself, listening more.",
    "gratitude_example": "I'm grateful for being wrong — it made me wiser.",
    "pause_cue": "Let humility feel like openness, not loss.",
    "placeholder": "Write what being wrong taught you."
  },
  {
    "anchor": "You learn best by living fully.",
    "prompt": "Think of something experience taught you that books couldn’t.",
    "example": "empathy, patience, courage, balance.",
    "gratitude_example": "I'm grateful for the lessons life teaches through living, not reading.",
    "pause_cue": "Let experience feel sacred for a moment.",
    "placeholder": "Write gratitude for a life lesson you lived."
  },
  {
    "anchor": "Curiosity dissolves fear.",
    "prompt": "Think of something you were once afraid to try but did anyway.",
    "example": "speaking up, traveling, changing paths.",
    "gratitude_example": "I'm grateful for the courage to explore what once scared me.",
    "pause_cue": "Let bravery feel like curiosity’s reward.",
    "placeholder": "Write gratitude for how courage grew from curiosity."
  },
  {
    "anchor": "Change is growth in disguise.",
    "prompt": "Think of a recent change you resisted at first but now appreciate.",
    "example": "moving, ending something, starting fresh.",
    "gratitude_example": "I'm grateful for the change that expanded my capacity to adapt.",
    "pause_cue": "Let adaptation feel graceful.",
    "placeholder": "Write gratitude for a change that helped you grow."
  },
  {
    "anchor": "Every ending is a hidden invitation to learn again.",
    "prompt": "Think of a closure that led to renewal.",
    "example": "job ending, breakup, graduation, moving on.",
    "gratitude_example": "I'm grateful for how endings clear space for evolution.",
    "pause_cue": "Let transition feel like invitation.",
    "placeholder": "Write what new beginning you’re thankful for."
  },
  {
    "anchor": "Curiosity turns walls into doors.",
    "prompt": "Think of a time a question opened new possibilities for you.",
    "example": "learning a skill, connecting with someone, shifting views.",
    "gratitude_example": "I'm grateful for curiosity that turned limitation into discovery.",
    "pause_cue": "Let wonder guide your thoughts.",
    "placeholder": "Write gratitude for where curiosity led you."
  },
  {
    "anchor": "Growth is not becoming someone new — it’s remembering who you are.",
    "prompt": "Think of something you rediscovered about yourself while learning.",
    "example": "confidence, creativity, calmness, purpose.",
    "gratitude_example": "I'm grateful for returning to parts of myself I once forgot.",
    "pause_cue": "Let recognition feel like reunion.",
    "placeholder": "Write what rediscovery you’re thankful for."
  },
  {
    "anchor": "Learning never ends — it only deepens.",
    "prompt": "Think of something you once thought you understood but now see differently.",
    "example": "love, success, health, happiness.",
    "gratitude_example": "I'm grateful for deeper understanding that comes with time.",
    "pause_cue": "Let growth feel continuous, not complete.",
    "placeholder": "Write gratitude for wisdom that keeps unfolding."
  }
],

  ),
  
  GratitudeCategory(
    categoryName: "Creativity & Expression",
    emoji: "💞",
    items: [
  {
    "anchor": "Creativity is the soul speaking in color.",
    "prompt": "Think of something you made or expressed that felt alive.",
    "example": "writing, designing, cooking, decorating, solving a problem.",
    "gratitude_example": "I'm grateful for the spark that lets me bring ideas to life.",
    "pause_cue": "Let creation feel like connection to your inner world.",
    "placeholder": "Write gratitude for a recent creative moment."
  },
  {
    "anchor": "Expression is freedom in gentle disguise.",
    "prompt": "Think of a time you expressed yourself honestly.",
    "example": "through words, art, movement, conversation.",
    "gratitude_example": "I'm grateful for the courage to express myself authentically.",
    "pause_cue": "Let honesty feel safe and liberating.",
    "placeholder": "Write what moment of self-expression you’re thankful for."
  },
  {
    "anchor": "Imagination is your inner child still playing.",
    "prompt": "Think of a moment you dreamed, invented, or envisioned something.",
    "example": "new idea, doodle, plan, story, fantasy.",
    "gratitude_example": "I'm grateful for the imagination that keeps life full of possibility.",
    "pause_cue": "Let playfulness replace pressure.",
    "placeholder": "Write gratitude for a creative idea that made you smile."
  },
  {
    "anchor": "Art is the act of turning feeling into form.",
    "prompt": "Think of something creative that helped you process emotion.",
    "example": "journaling, drawing, playing music, talking, dancing.",
    "gratitude_example": "I'm grateful for creativity that helps me turn pain into peace.",
    "pause_cue": "Let expression feel healing, not heavy.",
    "placeholder": "Write gratitude for an emotional release through creativity."
  },
  {
    "anchor": "Every creative act is a prayer for beauty.",
    "prompt": "Think of how you add beauty to the world, even in small ways.",
    "example": "arranging flowers, choosing colors, thoughtful gestures.",
    "gratitude_example": "I'm grateful for being able to leave small traces of beauty behind.",
    "pause_cue": "Let beauty feel humble and personal.",
    "placeholder": "Write gratitude for how you bring beauty into life."
  },
  {
    "anchor": "Inspiration visits those who make space for it.",
    "prompt": "Think of a quiet moment that brought you a creative idea.",
    "example": "in the shower, on a walk, before sleep, during rest.",
    "gratitude_example": "I'm grateful for the stillness that welcomes inspiration in.",
    "pause_cue": "Let openness feel effortless.",
    "placeholder": "Write what moment recently inspired you."
  },
  {
    "anchor": "Perfection kills what expression creates.",
    "prompt": "Think of a time you created without worrying about outcomes.",
    "example": "doodling, experimenting, trying something new.",
    "gratitude_example": "I'm grateful for freedom from perfection that lets creativity flow.",
    "pause_cue": "Let play feel more important than results.",
    "placeholder": "Write gratitude for creating freely."
  },
  {
    "anchor": "Your voice matters — even when it trembles.",
    "prompt": "Think of a time you shared your work or truth vulnerably.",
    "example": "sharing an idea, posting art, speaking up.",
    "gratitude_example": "I'm grateful for the courage to share myself with the world.",
    "pause_cue": "Let vulnerability feel powerful.",
    "placeholder": "Write what expression of yours you’re proud of."
  },
  {
    "anchor": "Creativity is the bridge between thought and emotion.",
    "prompt": "Think of how your creative work reflects your feelings.",
    "example": "your mood shaping colors, tone, rhythm, design.",
    "gratitude_example": "I'm grateful for the bridge my creativity builds between mind and heart.",
    "pause_cue": "Let awareness feel like artistry.",
    "placeholder": "Write gratitude for how your feelings shape what you create."
  },
  {
    "anchor": "Every act of creation affirms life.",
    "prompt": "Think of something you built or improved that made life better.",
    "example": "home project, idea, collaboration, invention.",
    "gratitude_example": "I'm grateful for the ability to build meaning into my surroundings.",
    "pause_cue": "Let creation feel sacred and simple.",
    "placeholder": "Write gratitude for what you’ve built recently."
  },
  {
    "anchor": "The muse loves playfulness.",
    "prompt": "Think of something you created just for fun.",
    "example": "silly doodle, funny post, humming a tune, decorating space.",
    "gratitude_example": "I'm grateful for moments where joy became art without purpose.",
    "pause_cue": "Let fun be your form of brilliance.",
    "placeholder": "Write gratitude for playful creativity."
  },
  {
    "anchor": "Expression doesn’t need an audience.",
    "prompt": "Think of something you created or said that no one saw — but felt true.",
    "example": "private writing, thoughts, sketches, prayers.",
    "gratitude_example": "I'm grateful for the creativity that exists even in solitude.",
    "pause_cue": "Let self-expression feel complete on its own.",
    "placeholder": "Write what private expression you’re thankful for."
  },
  {
    "anchor": "Creativity thrives on curiosity, not comparison.",
    "prompt": "Think of a time you stayed inspired instead of comparing yourself.",
    "example": "learning from others, focusing on process, enjoying flow.",
    "gratitude_example": "I'm grateful for the curiosity that keeps envy away.",
    "pause_cue": "Let curiosity feel contagious.",
    "placeholder": "Write what inspired you without competition."
  },
  {
    "anchor": "Art is honesty in another language.",
    "prompt": "Think of a song, poem, or piece of art that said what you couldn’t.",
    "example": "lyrics, quotes, movie scene, painting.",
    "gratitude_example": "I'm grateful for art that speaks what my heart feels.",
    "pause_cue": "Let resonance feel like understanding.",
    "placeholder": "Write gratitude for art that touched you deeply."
  },
  {
    "anchor": "Your creativity is proof you’re alive.",
    "prompt": "Think of something you did today that expressed who you are.",
    "example": "outfit, idea, words, kindness, design.",
    "gratitude_example": "I'm grateful for the daily ways I get to express myself.",
    "pause_cue": "Let creativity feel like breathing.",
    "placeholder": "Write gratitude for a small act of self-expression."
  },
  {
    "anchor": "In every constraint lies a new idea.",
    "prompt": "Think of a time limitation led you to think differently.",
    "example": "lack of time, tools, or options that sparked innovation.",
    "gratitude_example": "I'm grateful for challenges that push my creativity to grow.",
    "pause_cue": "Let constraint feel like inspiration, not restriction.",
    "placeholder": "Write gratitude for how you adapted creatively."
  },
  {
    "anchor": "You are a co-creator with life itself.",
    "prompt": "Think of something you’ve shaped in collaboration with others or nature.",
    "example": "teamwork, gardening, music, co-designing.",
    "gratitude_example": "I'm grateful for the shared creation that connects me to others and the world.",
    "pause_cue": "Let co-creation feel joyful and human.",
    "placeholder": "Write gratitude for something you’ve built together."
  },
  {
    "anchor": "Silence is the canvas creativity paints on.",
    "prompt": "Think of a quiet moment that brought you clarity or inspiration.",
    "example": "early morning, solitude, pause in conversation.",
    "gratitude_example": "I'm grateful for silence that makes new ideas possible.",
    "pause_cue": "Let calmness feel productive in its own way.",
    "placeholder": "Write gratitude for the silence that sparks your mind."
  },
  {
    "anchor": "Creativity heals what logic cannot reach.",
    "prompt": "Think of a time expressing yourself brought comfort or release.",
    "example": "art, writing, music, talking through emotions.",
    "gratitude_example": "I'm grateful for creativity’s power to turn emotion into understanding.",
    "pause_cue": "Let creation feel therapeutic.",
    "placeholder": "Write gratitude for how creativity has healed you."
  },
  {
    "anchor": "Imperfect art is still sacred.",
    "prompt": "Think of something you made that didn’t go as planned but still meant something.",
    "example": "rough sketch, flawed project, messy creation.",
    "gratitude_example": "I'm grateful for imperfection that still carries truth and beauty.",
    "pause_cue": "Let flaws feel authentic, not wrong.",
    "placeholder": "Write gratitude for imperfect creation."
  },
  {
    "anchor": "Every expression adds color to the world.",
    "prompt": "Think of how your creativity influences or brightens others’ lives.",
    "example": "inspiring someone, sharing ideas, spreading positivity.",
    "gratitude_example": "I'm grateful for being able to share something beautiful with others.",
    "pause_cue": "Let impact feel light, not pressured.",
    "placeholder": "Write gratitude for who your creativity touches."
  },
  {
    "anchor": "Flow is the moment when time disappears.",
    "prompt": "Think of the last time you were so absorbed that you forgot time.",
    "example": "writing, painting, designing, coding, cooking.",
    "gratitude_example": "I'm grateful for the joy of being lost in creative flow.",
    "pause_cue": "Let memory of flow feel like calm focus.",
    "placeholder": "Write gratitude for a recent flow moment."
  },
  {
    "anchor": "Every creation is a reflection of courage.",
    "prompt": "Think of a time you put yourself into your work without hiding.",
    "example": "showing your heart, being original, trusting intuition.",
    "gratitude_example": "I'm grateful for the courage to create something that feels true to me.",
    "pause_cue": "Let authenticity feel like power.",
    "placeholder": "Write gratitude for creating bravely."
  },
  {
    "anchor": "Creativity is love translated into motion.",
    "prompt": "Think of how creating connects you to love or joy.",
    "example": "cooking for someone, writing, designing, singing.",
    "gratitude_example": "I'm grateful for creativity that turns love into something tangible.",
    "pause_cue": "Let affection and inspiration intertwine.",
    "placeholder": "Write gratitude for how love inspires your creativity."
  },
  {
    "anchor": "You are both the artist and the artwork.",
    "prompt": "Think of how your life itself reflects your creative choices.",
    "example": "home decor, habits, relationships, self-growth.",
    "gratitude_example": "I'm grateful for crafting a life that feels like my own creation.",
    "pause_cue": "Let your whole life feel like a masterpiece in progress.",
    "placeholder": "Write gratitude for how you shape your world creatively."
  }
],

  ),
  
  GratitudeCategory(
    categoryName: "Spirituality / Universe",
    emoji: "💞",
    items: [
      {
    "anchor": "You are part of something vast and kind.",
    "prompt": "Think of a moment when you felt connected to something greater than yourself.",
    "example": "under a night sky, in prayer, during meditation, in awe.",
    "gratitude_example": "I'm grateful for moments when I feel held by something bigger than me.",
    "pause_cue": "Let that sense of belonging expand softly.",
    "placeholder": "Write gratitude for when you felt connected to the universe."
  },
  {
    "anchor": "Faith is trusting what you can’t yet see.",
    "prompt": "Think of a time you kept hope when outcomes were uncertain.",
    "example": "during a challenge, waiting, healing, or change.",
    "gratitude_example": "I'm grateful for the unseen guidance that carried me through uncertainty.",
    "pause_cue": "Let trust feel like peace in motion.",
    "placeholder": "Write what unseen support you’re thankful for."
  },
  {
    "anchor": "Stillness is where spirit whispers.",
    "prompt": "Think of a quiet moment that brought clarity or comfort.",
    "example": "morning calm, deep breath, meditation, nature silence.",
    "gratitude_example": "I'm grateful for the quiet that lets wisdom rise inside me.",
    "pause_cue": "Let silence feel alive, not empty.",
    "placeholder": "Write gratitude for the peace within stillness."
  },
  {
    "anchor": "Everything you need is already here.",
    "prompt": "Think of a time life surprised you with exactly what you needed.",
    "example": "help, timing, opportunity, healing.",
    "gratitude_example": "I'm grateful for the way the universe provides at the right time.",
    "pause_cue": "Let trust replace urgency.",
    "placeholder": "Write gratitude for a moment life supported you perfectly."
  },
  {
    "anchor": "You are both the question and the answer.",
    "prompt": "Think of something you sought clarity on that revealed itself within.",
    "example": "intuition, dream, insight, self-realization.",
    "gratitude_example": "I'm grateful for the guidance that rises from within when I listen.",
    "pause_cue": "Let inner knowing feel sacred.",
    "placeholder": "Write gratitude for wisdom that came from inside you."
  },
  {
    "anchor": "The divine speaks through timing.",
    "prompt": "Think of a delay or detour that turned out to serve you.",
    "example": "missed event, rejection, waiting period.",
    "gratitude_example": "I'm grateful for divine timing that rearranges things for my good.",
    "pause_cue": "Let patience feel holy, not heavy.",
    "placeholder": "Write what unexpected timing you’re thankful for."
  },
  {
    "anchor": "Surrender isn’t giving up — it’s giving trust.",
    "prompt": "Think of a time you released control and things still worked out.",
    "example": "letting go of worry, trusting flow, accepting outcomes.",
    "gratitude_example": "I'm grateful for learning that peace begins where control ends.",
    "pause_cue": "Let surrender feel like soft strength.",
    "placeholder": "Write gratitude for a time you let go and found peace."
  },
  {
    "anchor": "Miracles often wear ordinary clothes.",
    "prompt": "Think of a small coincidence or sign that felt meaningful.",
    "example": "unexpected call, perfect timing, words you needed to hear.",
    "gratitude_example": "I'm grateful for the subtle ways the universe speaks to me.",
    "pause_cue": "Let awareness turn coincidences into connection.",
    "placeholder": "Write gratitude for a small miracle you noticed."
  },
  {
    "anchor": "Faith begins where certainty ends.",
    "prompt": "Think of a time you trusted without proof.",
    "example": "following intuition, taking a leap, believing in healing.",
    "gratitude_example": "I'm grateful for faith that steadies me when logic cannot.",
    "pause_cue": "Let uncertainty feel safe for a moment.",
    "placeholder": "Write gratitude for what you’ve trusted without evidence."
  },
  {
    "anchor": "Light and shadow are both teachers.",
    "prompt": "Think of something difficult that revealed a hidden blessing.",
    "example": "loss leading to growth, solitude leading to self-love.",
    "gratitude_example": "I'm grateful for the lessons that came wrapped in challenge.",
    "pause_cue": "Let duality feel complete, not conflicting.",
    "placeholder": "Write gratitude for what darkness taught you."
  },
  {
    "anchor": "The universe moves in quiet symmetry.",
    "prompt": "Think of a moment when everything seemed to align effortlessly.",
    "example": "chance encounter, perfect solution, instant understanding.",
    "gratitude_example": "I'm grateful for synchronicities that remind me life is intelligent.",
    "pause_cue": "Let harmony feel divine, not random.",
    "placeholder": "Write what aligned moment you’re thankful for."
  },
  {
    "anchor": "Grace meets you where effort ends.",
    "prompt": "Think of a moment when help arrived right when you stopped forcing it.",
    "example": "problem resolving, support appearing, peace returning.",
    "gratitude_example": "I'm grateful for grace that meets me when I finally release control.",
    "pause_cue": "Let relief feel sacred.",
    "placeholder": "Write gratitude for a moment when grace carried you."
  },
  {
    "anchor": "You are a drop of the ocean remembering it’s the sea.",
    "prompt": "Think of how you’re connected to everything living.",
    "example": "breath, nature, energy, shared love.",
    "gratitude_example": "I'm grateful for remembering that I am never truly separate.",
    "pause_cue": "Let unity feel like home.",
    "placeholder": "Write gratitude for connection with all that exists."
  },
  {
    "anchor": "Your soul already knows the way.",
    "prompt": "Think of a time you followed intuition and it led somewhere good.",
    "example": "spontaneous decision, gut feeling, quiet certainty.",
    "gratitude_example": "I'm grateful for the inner compass that always points toward truth.",
    "pause_cue": "Let intuition feel trustworthy.",
    "placeholder": "Write gratitude for a moment when intuition guided you."
  },
  {
    "anchor": "The sacred hides in the simple.",
    "prompt": "Think of a small daily act that feels spiritual to you.",
    "example": "morning light, tea ritual, gratitude, prayer, silence.",
    "gratitude_example": "I'm grateful for sacredness woven into my daily routines.",
    "pause_cue": "Let reverence fill ordinary moments.",
    "placeholder": "Write gratitude for a daily act that feels divine."
  },
  {
    "anchor": "Love is the language of the divine.",
    "prompt": "Think of a moment love felt universal — beyond words or reason.",
    "example": "deep connection, forgiveness, compassion, empathy.",
    "gratitude_example": "I'm grateful for love that reminds me of divinity in everyone.",
    "pause_cue": "Let love feel infinite.",
    "placeholder": "Write gratitude for a love that felt transcendent."
  },
  {
    "anchor": "Prayer is a conversation, not a request.",
    "prompt": "Think of a moment when reflection or prayer gave peace, not answers.",
    "example": "journaling, silence, meditation, talking to the universe.",
    "gratitude_example": "I'm grateful for conversations with the divine that bring me calm.",
    "pause_cue": "Let peace feel like a reply.",
    "placeholder": "Write gratitude for a time reflection brought comfort."
  },
  {
    "anchor": "Divine timing never rushes.",
    "prompt": "Think of something that arrived exactly when you were ready.",
    "example": "opportunity, person, message, realization.",
    "gratitude_example": "I'm grateful for how the universe waits until I’m prepared to receive.",
    "pause_cue": "Let patience feel sacred again.",
    "placeholder": "Write gratitude for perfect timing in your life."
  },
  {
    "anchor": "Everything belongs — even confusion.",
    "prompt": "Think of a time uncertainty later made sense.",
    "example": "change of path, emotional phase, unanswered prayer.",
    "gratitude_example": "I'm grateful for realizing that even detours serve a higher rhythm.",
    "pause_cue": "Let acceptance replace resistance.",
    "placeholder": "Write gratitude for something confusing that now feels meaningful."
  },
  {
    "anchor": "You are guided, even when you feel lost.",
    "prompt": "Think of a time guidance came just when you needed it most.",
    "example": "advice, intuition, coincidence, dream.",
    "gratitude_example": "I'm grateful for the unseen guidance that keeps lighting my path.",
    "pause_cue": "Let trust feel deeper than doubt.",
    "placeholder": "Write gratitude for a sign or guidance you received."
  },
  {
    "anchor": "Stillness reveals what striving hides.",
    "prompt": "Think of a time you stopped pushing and clarity returned.",
    "example": "stepping back, meditating, walking, resting.",
    "gratitude_example": "I'm grateful for moments where stopping became the way forward.",
    "pause_cue": "Let stillness feel productive in its own way.",
    "placeholder": "Write gratitude for peace that followed surrender."
  },
  {
    "anchor": "You are the universe experiencing itself.",
    "prompt": "Think of a time you felt awe for existence itself.",
    "example": "stars, life’s complexity, love’s mystery.",
    "gratitude_example": "I'm grateful for being part of this miracle called life.",
    "pause_cue": "Let wonder dissolve separation.",
    "placeholder": "Write gratitude for simply existing."
  },
  {
    "anchor": "The divine works quietly through you.",
    "prompt": "Think of a moment you unknowingly became an answer to someone’s prayer.",
    "example": "comforting words, timing, kindness, support.",
    "gratitude_example": "I'm grateful for being a small vessel of something greater.",
    "pause_cue": "Let humility meet reverence.",
    "placeholder": "Write gratitude for a moment you were guided to help."
  },
  {
    "anchor": "Gratitude is a spiritual practice.",
    "prompt": "Think of how thankfulness deepens your connection to life itself.",
    "example": "noticing blessings, slowing down, saying thank you.",
    "gratitude_example": "I'm grateful that gratitude itself connects me to divinity.",
    "pause_cue": "Let appreciation feel holy.",
    "placeholder": "Write gratitude for gratitude itself."
  },
  {
    "anchor": "Light always finds a way in.",
    "prompt": "Think of a time hope returned when you least expected it.",
    "example": "emotional breakthrough, support, sign, renewal.",
    "gratitude_example": "I'm grateful for hope’s quiet return when all seemed dim.",
    "pause_cue": "Let faith feel like light spreading inside.",
    "placeholder": "Write gratitude for the light that found you."
  },
  {
    "anchor": "You are never separate from love’s source.",
    "prompt": "Think of a moment you felt truly unconditionally loved.",
    "example": "by someone, a pet, life itself, or your own heart.",
    "gratitude_example": "I'm grateful for knowing I am loved without needing to earn it.",
    "pause_cue": "Let that love surround you again now.",
    "placeholder": "Write gratitude for being loved simply for existing."
  }
    ],
  ),
  
  GratitudeCategory(
    categoryName: "Moments & Simple Joys",
    emoji: "💞",
    items: [
      {
        "anchor": "Joy often hides in plain sight.",
        "prompt": "Think of a small everyday moment that made you smile recently.",
        "example": "sunlight on your face, laughter, a warm drink, good music.",
        "gratitude_example": "I'm grateful for the tiny moments that remind me life is gentle.",
        "pause_cue": "Let simplicity feel precious.",
        "placeholder": "Write gratitude for a simple moment that brought you joy."
      },
      {
        "anchor": "Happiness is often just noticing.",
        "prompt": "Think of something you would normally overlook that felt beautiful today.",
        "example": "the smell of rain, clean sheets, a kind gesture.",
        "gratitude_example": "I'm grateful for noticing what’s been here all along.",
        "pause_cue": "Let awareness feel like abundance.",
        "placeholder": "Write gratitude for something you noticed and appreciated."
      },
      {
        "anchor": "Joy doesn’t need a reason.",
        "prompt": "Think of a moment you felt lighthearted for no particular cause.",
        "example": "humming a tune, walking slowly, laughing at nothing.",
        "gratitude_example": "I'm grateful for spontaneous joy that visits without warning.",
        "pause_cue": "Let playfulness rise gently inside.",
        "placeholder": "Write gratitude for unplanned happiness."
      },
      {
        "anchor": "Peace hides in the pause between moments.",
        "prompt": "Think of a quiet instant that felt complete on its own.",
        "example": "morning stillness, sip of tea, slow breath, sunset view.",
        "gratitude_example": "I'm grateful for moments where nothing needed to be more than it was.",
        "pause_cue": "Let the pause feel full, not empty.",
        "placeholder": "Write gratitude for a small moment of peace."
      },
      {
        "anchor": "Ordinary days hold extraordinary light.",
        "prompt": "Think of something that made a regular day special.",
        "example": "a good meal, text from a friend, kind smile, small win.",
        "gratitude_example": "I'm grateful for the light hiding in my ordinary days.",
        "pause_cue": "Let everyday life feel magical.",
        "placeholder": "Write gratitude for something simple that brightened your day."
      },
      {
        "anchor": "Simplicity is luxury for the soul.",
        "prompt": "Think of something uncomplicated that brings you deep comfort.",
        "example": "cozy blanket, clean home, routine walk, cup of coffee.",
        "gratitude_example": "I'm grateful for simple comforts that make life feel rich.",
        "pause_cue": "Let ease feel like abundance.",
        "placeholder": "Write gratitude for a simple comfort you cherish."
      },
      {
        "anchor": "Small joys stitch meaning into time.",
        "prompt": "Think of a small ritual that makes your day feel anchored.",
        "example": "morning stretch, journaling, evening candle, gratitude list.",
        "gratitude_example": "I'm grateful for small habits that keep me steady and joyful.",
        "pause_cue": "Let repetition feel sacred, not boring.",
        "placeholder": "Write gratitude for a daily ritual that brings joy."
      },
      {
        "anchor": "Every laugh is proof of resilience.",
        "prompt": "Think of a time humor lightened your heart when things felt heavy.",
        "example": "inside joke, silly moment, unexpected laughter.",
        "gratitude_example": "I'm grateful for laughter that reminds me I can still feel light.",
        "pause_cue": "Let joy feel stronger than worry.",
        "placeholder": "Write gratitude for laughter that healed you."
      },
      {
        "anchor": "Joy multiplies when shared.",
        "prompt": "Think of a small happy moment you shared with someone recently.",
        "example": "meal, smile, conversation, memory.",
        "gratitude_example": "I'm grateful for simple moments that feel fuller when shared.",
        "pause_cue": "Let connection feel joyful, not heavy.",
        "placeholder": "Write gratitude for a shared moment of happiness."
      },
      {
        "anchor": "You don’t need big moments to feel alive.",
        "prompt": "Think of something small that reminded you life is precious.",
        "example": "morning light, sound of birds, feeling of breath.",
        "gratitude_example": "I'm grateful for being alive in the simplest ways.",
        "pause_cue": "Let awareness feel enough.",
        "placeholder": "Write gratitude for a small sign of life that moved you."
      },
      {
        "anchor": "Joy begins where expectation ends.",
        "prompt": "Think of a moment that made you happy simply because you weren’t trying.",
        "example": "unexpected calm, kindness, quiet delight.",
        "gratitude_example": "I'm grateful for unplanned happiness that comes from surrender.",
        "pause_cue": "Let ease replace striving.",
        "placeholder": "Write gratitude for a joy that found you unexpectedly."
      },
      {
        "anchor": "Even a breath can be beautiful.",
        "prompt": "Pause and notice your next breath — what does it give you?",
        "example": "space, calm, energy, awareness.",
        "gratitude_example": "I'm grateful for every breath that keeps me connected to now.",
        "pause_cue": "Let breathing feel like a gift.",
        "placeholder": "Write gratitude for your breath and this present moment."
      },
      {
        "anchor": "Joy often hides in repetition.",
        "prompt": "Think of something you do often that quietly brings you peace.",
        "example": "cooking, walking, watering plants, tidying.",
        "gratitude_example": "I'm grateful for the comfort of familiar routines.",
        "pause_cue": "Let monotony feel meaningful.",
        "placeholder": "Write gratitude for a simple task that soothes you."
      },
      {
        "anchor": "Gratitude turns moments into memories.",
        "prompt": "Think of a small joy you want to remember forever.",
        "example": "hug, sunset, laughter, gentle silence.",
        "gratitude_example": "I'm grateful for moments so pure they stay with me.",
        "pause_cue": "Let nostalgia feel warm, not sad.",
        "placeholder": "Write gratitude for a small joy you never want to forget."
      },
      {
        "anchor": "A smile is a sunrise on the face.",
        "prompt": "Think of something that made you smile today.",
        "example": "text, song, pet, memory, kind word.",
        "gratitude_example": "I'm grateful for reasons to smile that appear without effort.",
        "pause_cue": "Let your smile linger a little longer.",
        "placeholder": "Write gratitude for what made you smile."
      },
      {
        "anchor": "Joy expands through attention.",
        "prompt": "Think of how focusing on one small joy made it richer.",
        "example": "savoring food, enjoying music, watching light dance.",
        "gratitude_example": "I'm grateful for how mindfulness deepens my happiness.",
        "pause_cue": "Let focus feel like appreciation.",
        "placeholder": "Write gratitude for a moment you fully savored."
      },
      {
        "anchor": "Life’s sweetness is found in its pauses.",
        "prompt": "Think of a small pause that gave you peace today.",
        "example": "waiting calmly, deep breath, sipping tea slowly.",
        "gratitude_example": "I'm grateful for pauses that let life’s sweetness sink in.",
        "pause_cue": "Let slowing down feel sacred.",
        "placeholder": "Write gratitude for a restful pause today."
      },
      {
        "anchor": "Even routine moments carry wonder.",
        "prompt": "Think of something in your daily routine that you’re grateful for.",
        "example": "your commute, shower, breakfast, evening quiet.",
        "gratitude_example": "I'm grateful for the rhythm of everyday moments.",
        "pause_cue": "Let habit feel like harmony.",
        "placeholder": "Write gratitude for part of your routine you cherish."
      },
      {
        "anchor": "Joy is a language the heart remembers.",
        "prompt": "Think of a childhood joy you still love in some way.",
        "example": "favorite food, song, smell, place, play.",
        "gratitude_example": "I'm grateful for how joy stays with me through time.",
        "pause_cue": "Let memory feel like returning home.",
        "placeholder": "Write gratitude for an old joy that still warms your heart."
      },
      {
        "anchor": "Quiet happiness is still happiness.",
        "prompt": "Think of a calm joy that doesn’t shout but stays long after.",
        "example": "reading, sunset, peaceful silence, closeness.",
        "gratitude_example": "I'm grateful for gentle happiness that stays softly in the heart.",
        "pause_cue": "Let calm joy feel complete.",
        "placeholder": "Write gratitude for a peaceful kind of happiness."
      },
      {
        "anchor": "Tiny joys add up to a life well lived.",
        "prompt": "Think of three small things that made today better.",
        "example": "warm shower, smile, taste of coffee, message from someone.",
        "gratitude_example": "I'm grateful for the mosaic of little joys that build my days.",
        "pause_cue": "Let small joys feel big for a moment.",
        "placeholder": "Write gratitude for the little joys of today."
      },
      {
        "anchor": "Joy is how the heart thanks life.",
        "prompt": "Think of a simple joy that makes you thankful to be alive.",
        "example": "nature, laughter, touch, warmth.",
        "gratitude_example": "I'm grateful for joy itself — proof that life is good.",
        "pause_cue": "Let thankfulness feel like lightness.",
        "placeholder": "You can write gratitude for a joy that makes life worth living."
      },
      {
        "anchor": "The moment you notice, it becomes beautiful.",
        "prompt": "Think of something around you right now that deserves appreciation.",
        "example": "a sound, smell, object, light, feeling.",
        "gratitude_example": "I'm grateful for beauty that appears when I pay attention.",
        "pause_cue": "Let awareness transform your surroundings.",
        "placeholder": "You can write gratitude for what you appreciate right now."
      },
      {
        "anchor": "Simple moments are love in disguise.",
        "prompt": "Think of a small act of love that made your day gentler.",
        "example": "smile, meal prepared, message, hug.",
        "gratitude_example": "I'm grateful for love that hides in ordinary gestures.",
        "pause_cue": "Let warmth spread quietly through memory.",
        "placeholder": "You can write gratitude for a small act of love."
      },
      {
        "anchor": "Even endings can hold soft joy.",
        "prompt": "Think of how you unwind or close your day with appreciation.",
        "example": "journaling, dim lights, gratitude, reflection.",
        "gratitude_example": "I'm grateful for peaceful endings that prepare me for rest.",
        "pause_cue": "Let closure feel kind.",
        "placeholder": "You can write gratitude for how you end your days with calm."
      }
    ],
  ),
];