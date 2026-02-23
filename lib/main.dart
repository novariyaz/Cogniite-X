import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const CogniitexApp());
}

class CogniitexApp extends StatelessWidget {
  const CogniitexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CogniiteX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter', // Falls back nicely if Inter is not added
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF1C1E27),
        colorScheme: const ColorScheme.dark(
          primary: Colors.white,
          background: Color(0xFF1C1E27),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Base Background
          Container(color: const Color(0xFF1C1E27)),

          // 1. Top Left Glow (#6C63FF)
          Positioned(
            top: -150,
            left: -150,
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF6C63FF).withValues(alpha: 0.15),
                    const Color(0xFF6C63FF).withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),

          // 2. Bottom Right Glow (#00D4FF)
          Positioned(
            bottom: -100,
            right: -100,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF00D4FF).withValues(alpha: 0.10),
                    const Color(0xFF00D4FF).withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),

          // 3. Center Top Subtle Glow (#4ADE80)
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF4ADE80).withValues(alpha: 0.08),
                      const Color(0xFF4ADE80).withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Foreground Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 32.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Top Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CustomPaint(
                            size: Size(32, 32),
                            painter: CogniiteXLogo(),
                          ),
                          const SizedBox(width: 14),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 22,
                                letterSpacing: 0.3,
                                color: Colors.white,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Cogniite ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                TextSpan(
                                  text: 'X',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF6C63FF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.search, color: Colors.white),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SearchScreen(),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SettingsScreen(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 16),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF6C63FF),
                                width: 2.5,
                              ),
                              color: const Color(0xFF2C2E3A),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'RK',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const Spacer(),

                  // Center Empty State
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: const BoxDecoration(
                          color: Color(0xFF2E3140),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.menu_book_rounded,
                          size: 84,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 48),
                      const Text(
                        "Let's get started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Create your first notebook below.",
                        style: TextStyle(
                          color: Color(0xFF8E909B),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),

                  const Spacer(),

                  // Bottom Buttons
                  const AnimatedBottomActions(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedBottomActions extends StatefulWidget {
  const AnimatedBottomActions({super.key});

  @override
  State<AnimatedBottomActions> createState() => _AnimatedBottomActionsState();
}

class _AnimatedBottomActionsState extends State<AnimatedBottomActions>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Camera Button Stack
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return CustomPaint(
                    painter: NeonBorderPainter(
                      animationValue: _controller.value,
                      isCircle: true,
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                  size: 28,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        const SizedBox(width: 20),
        // Create New Button Stack
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return CustomPaint(
                      painter: NeonBorderPainter(
                        animationValue: _controller.value,
                        isCircle: false,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 64,
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => const AddSourceScreen(),
                    );
                  },
                  child: Stack(
                    children: [
                      // 1) Bottom Layer - Frosted glass blur
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: Container(color: Colors.transparent),
                          ),
                        ),
                      ),
                      // 2) Middle Layer - Glass tint gradient & 3) Edge Highlight
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 1.2,
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withOpacity(0.15),
                                Colors.white.withOpacity(0.05),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // 4) Subtle inner top highlight
                      Positioned(
                        top: 1.2, // Just inside the border
                        left: 20,
                        right: 20,
                        child: Container(
                          height: 1,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.3),
                                blurRadius: 2,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // 5) Text content
                      const Center(
                        child: Text(
                          "+ Create New",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NeonBorderPainter extends CustomPainter {
  final double animationValue;
  final bool isCircle;

  NeonBorderPainter({required this.animationValue, this.isCircle = false});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final sweepGradient = SweepGradient(
      colors: const [
        Color(0xFF6C63FF), // Purple
        Color(0xFF00D4FF), // Cyan
        Color(0xFF4ADE80), // Green
        Color(0xFFFF6B6B), // Pink-Red
        Color(0xFF6C63FF), // Purple
      ],
      transform: GradientRotation(animationValue * 2 * math.pi),
    );

    // Glow outline
    final glowPaint = Paint()
      ..shader = sweepGradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 6);

    // Solid inner outline
    final solidPaint = Paint()
      ..shader = sweepGradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    if (isCircle) {
      final center = Offset(size.width / 2, size.height / 2);
      final radius = size.width / 2;
      canvas.drawCircle(center, radius, glowPaint);
      canvas.drawCircle(center, radius, solidPaint);
    } else {
      final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(32));
      canvas.drawRRect(rrect, glowPaint);
      canvas.drawRRect(rrect, solidPaint);
    }
  }

  @override
  bool shouldRepaint(covariant NeonBorderPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}

class CogniiteXLogo extends CustomPainter {
  const CogniiteXLogo();

  @override
  void paint(Canvas canvas, Size size) {
    // 1) Define the gradient for the entire logo
    // Purple -> Green -> Cyan
    final gradient = const LinearGradient(
      colors: [Color(0xFF6C63FF), Color(0xFF4ADE80), Color(0xFF00D4FF)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    // 2) General paint setup for stoked lines
    final strokePaint = Paint()
      ..shader = gradient
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final center = Offset(size.width / 2, size.height / 2);

    // 3) Draw the stylized 'C'
    // A 'C' is basically a circle with the right side missing.
    // We'll draw two arcs to make it look dynamic/layered.

    // Outer arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: 14),
      math.pi / 4, // start angle (bottom right)
      1.5 * math.pi, // sweep angle (goes around to top right)
      false,
      strokePaint,
    );

    // Inner arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: 9),
      math.pi / 3,
      1.3 * math.pi,
      false,
      strokePaint,
    );

    // 4) Draw the inner diamond/rhombus in the opening
    final fillPaint = Paint()
      ..shader = gradient
      ..style = PaintingStyle.fill;

    // The opening is on the right. We'll place the diamond slightly to the right of center.
    final double dx = center.dx + 4;
    final double dy = center.dy;
    final double sizeD = 3.5; // distance from diamond center to points

    final path = Path()
      ..moveTo(dx, dy - sizeD) // Top
      ..lineTo(dx + sizeD, dy) // Right
      ..lineTo(dx, dy + sizeD) // Bottom
      ..lineTo(dx - sizeD, dy) // Left
      ..close();

    canvas.drawPath(path, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class AudioOverviewScreen extends StatefulWidget {
  const AudioOverviewScreen({super.key});

  @override
  State<AudioOverviewScreen> createState() => _AudioOverviewScreenState();
}

class _AudioOverviewScreenState extends State<AudioOverviewScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _waveController;

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1E27),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Audio Overview',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildPlayerCard(),
            const SizedBox(height: 32),
            _buildTranscriptSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2030),
        border: Border.all(color: const Color(0xFF2A2D3A), width: 1.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // Avatars
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAvatar(
                initials: 'A1',
                colors: const [Color(0xFF6C63FF), Color(0xFF00D4FF)],
              ),
              const SizedBox(width: 8), // slightly spaced or overlapped
              _buildAvatar(
                initials: 'A2',
                colors: const [Color(0xFF4ADE80), Color(0xFF00D4FF)],
              ),
            ],
          ),
          const SizedBox(height: 24),

          const Text(
            'Cogniite X Hosts',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'My Notebook',
            style: TextStyle(color: Color(0xFF8E909B), fontSize: 14),
          ),
          const SizedBox(height: 32),

          // Waveform
          SizedBox(
            height: 40,
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Color(0xFF6C63FF), Color(0xFF00D4FF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(bounds),
              child: AnimatedBuilder(
                animation: _waveController,
                builder: (context, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(30, (index) {
                      // Generate pseudo-random heights based on sine waves and animation
                      final baseHeight =
                          10.0 + (math.sin(index * 0.5) * 10).abs();
                      final animValue = math.sin(
                        (_waveController.value * math.pi * 2) + (index * 0.2),
                      );
                      final finalHeight =
                          baseHeight + (animValue * 10).clamp(0.0, 20.0);

                      return Container(
                        width: 4,
                        height: finalHeight.clamp(4.0, 40.0),
                        margin: const EdgeInsets.symmetric(horizontal: 1.5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Time
          const Text(
            '01:24 / 08:45',
            style: TextStyle(color: Color(0xFF8E909B), fontSize: 14),
          ),
          const SizedBox(height: 24),

          // Controls
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.replay_10,
                  color: Colors.white,
                  size: 32,
                ),
                onPressed: () {},
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF6C63FF),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.pause, color: Colors.white, size: 40),
                  onPressed: () {},
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.forward_10,
                  color: Colors.white,
                  size: 32,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar({required String initials, required List<Color> colors}) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: colors.first.withOpacity(0.4),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _buildTranscriptSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Transcript',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildTranscriptItem(
            speaker: 'Host A',
            color: const Color(0xFF00D4FF),
            text:
                "Welcome to today's overview. We're looking at the architecture document uploaded.",
          ),
          _buildTranscriptItem(
            speaker: 'Host B',
            color: const Color(0xFF4ADE80),
            text:
                "That's right. The document highlights a 4-layer approach which separates concerns effectively.",
          ),
          _buildTranscriptItem(
            speaker: 'Host A',
            color: const Color(0xFF00D4FF),
            text:
                "It also mentions using Riverpod for state injection. That's a very robust choice for scaling.",
          ),
          _buildTranscriptItem(
            speaker: 'Host B',
            color: const Color(0xFF4ADE80),
            text:
                "Exactly. It's becoming the standard for modern Flutter apps as highlighted in the embedded video.",
          ),
          const SizedBox(height: 48), // Bottom padding
        ],
      ),
    );
  }

  Widget _buildTranscriptItem({
    required String speaker,
    required Color color,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            speaker,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class NotebookDetailScreen extends StatefulWidget {
  const NotebookDetailScreen({super.key});

  @override
  State<NotebookDetailScreen> createState() => _NotebookDetailScreenState();
}

class _NotebookDetailScreenState extends State<NotebookDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1E27),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'My Notebook',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StudyToolsScreen(),
                ),
              );
            },
            icon: const Icon(Icons.auto_awesome, color: Colors.white, size: 20),
            label: const Text(
              'Study Tools',
              style: TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.white),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFF6C63FF),
          indicatorWeight: 3,
          labelColor: Colors.white,
          unselectedLabelColor: const Color(0xFF8E909B),
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          tabs: const [
            Tab(text: 'Sources'),
            Tab(text: 'Chat'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildSourcesTab(), _buildChatTab()],
      ),
    );
  }

  Widget _buildSourcesTab() {
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            _buildSourceCard(
              icon: Icons.picture_as_pdf_outlined,
              title: 'Flutter Architecture Overview',
              subtitle: 'PDF Document • 2.4 MB',
            ),
            const SizedBox(height: 16),
            _buildSourceCard(
              icon: Icons.public,
              title: 'React vs Vue 2026',
              subtitle: 'Website • Dev.to',
            ),
            const SizedBox(height: 16),
            _buildSourceCard(
              icon: Icons.play_circle_outline,
              title: 'Advanced State Management',
              subtitle: 'YouTube Video • 14:20',
            ),
            const SizedBox(height: 100), // Padding for the floating button
          ],
        ),
        Positioned(
          bottom: 32,
          right: 24,
          child: FloatingActionButton.extended(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => const AddSourceScreen(),
              );
            },
            backgroundColor: const Color(0xFF6C63FF),
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text(
              'Add Source',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSourceCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2030),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF8E909B),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Color(0xFF8E909B)),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildChatTab() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(24.0),
            children: [
              _buildUserMessage('Can you summarize the architecture PDF?'),
              const SizedBox(height: 24),
              _buildAIMessage(
                'Certainly. The architecture PDF describes a 4-layer approach: Presentation, Domain, Data, and Infrastructure. It heavily emphasizes using the Repository pattern and Riverpod for state injection...',
              ),
              const SizedBox(height: 24),
              _buildUserMessage('What about the state management video?'),
              const SizedBox(height: 24),
              _buildAIMessage(
                'The video compares Riverpod with standard Provider and shows how immutable states reduce bugs. It demonstrates a complete login flow using state notifiers.',
              ),
            ],
          ),
        ),
        _buildChatInput(),
      ],
    );
  }

  Widget _buildUserMessage(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
          color: Color(0xFF6C63FF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            height: 1.4,
          ),
        ),
      ),
    );
  }

  Widget _buildAIMessage(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // AI Avatar
        Container(
          width: 32,
          height: 32,
          margin: const EdgeInsets.only(right: 12, top: 4),
          child: const CustomPaint(painter: CogniiteXLogo()),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: Color(0xFF252730),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.4,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChatInput() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      decoration: const BoxDecoration(color: Color(0xFF1C1E27)),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E2030),
          border: Border.all(color: const Color(0xFF3A3D4E), width: 1.5),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            const Expanded(
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Ask Cogniite X...',
                  hintStyle: TextStyle(color: Color(0xFF8E909B), fontSize: 16),
                  border: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF6C63FF),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StudyToolsScreen extends StatelessWidget {
  const StudyToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1E27),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Study Tools',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        children: [
          const Text(
            'AI-generated insights from your sources',
            style: TextStyle(color: Color(0xFF8E909B), fontSize: 16),
          ),
          const SizedBox(height: 24),
          _buildToolCard(
            context: context,
            title: 'Summary',
            description: 'Get a concise overview of all your sources',
            icon: Icons.auto_awesome,
            iconColor: const Color(0xFF6C63FF),
          ),
          const SizedBox(height: 16),
          _buildToolCard(
            context: context,
            title: 'Study Guide',
            description: 'Structured notes and key concepts to learn',
            icon: Icons.school,
            iconColor: const Color(0xFF4ADE80),
          ),
          const SizedBox(height: 16),
          _buildToolCard(
            context: context,
            title: 'FAQ',
            description: 'Frequently asked questions from your content',
            icon: Icons.quiz,
            iconColor: const Color(0xFF00D4FF),
          ),
          const SizedBox(height: 16),
          _buildToolCard(
            context: context,
            title: 'Key Takeaways',
            description: 'The most important points highlighted',
            icon: Icons.lightbulb,
            iconColor: const Color(0xFFFFB347),
          ),
          const SizedBox(height: 16),
          _buildToolCard(
            context: context,
            title: 'Timeline',
            description: 'Chronological breakdown of events and topics',
            icon: Icons.timeline,
            iconColor: const Color(0xFFFF6B6B),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildToolCard({
    required BuildContext context,
    required String title,
    required String description,
    required IconData icon,
    required Color iconColor,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StudyResultScreen(title: title),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1E2030),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF2A2D3A), width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: iconColor, size: 24),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: Color(0xFF8E909B),
                  size: 28,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              description,
              style: const TextStyle(
                color: Color(0xFF8E909B),
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StudyResultScreen extends StatelessWidget {
  final String title;

  const StudyResultScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1E27),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.generating_tokens_outlined,
                color: Color(0xFF6C63FF),
                size: 64,
              ),
              const SizedBox(height: 24),
              Text(
                'Generating $title content...',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                'Cogniite X is securely analyzing your sources.',
                style: TextStyle(color: Color(0xFF8E909B), fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
} // end of file

class AddSourceScreen extends StatelessWidget {
  const AddSourceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Color(0xFF252730),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          // Drag handle
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Top bar with close button
          Padding(
            padding: const EdgeInsets.only(top: 4.0, right: 16.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 28),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16), // 16px top padding above headline
                  // Centered Headline
                  const Text(
                    'Create audio overviews',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: 'from ',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: 'your notes',
                          style: TextStyle(color: Color(0xFF4ADE80)),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ), // 20px spacing between headline and search field
                  // Search Text Field
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF3B82F6),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Find sources from the web',
                        hintStyle: const TextStyle(
                          color: Color(0xFF8E909B),
                          fontWeight: FontWeight.w500,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 18,
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            margin: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Color(0xFF3B82F6),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Caption
                  const Text(
                    'Or upload your files',
                    style: TextStyle(
                      color: Color(0xFF8E909B),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 24),

                  // Stacked Buttons
                  _buildSourceButton(
                    icon: Icons.picture_as_pdf_outlined,
                    label: 'PDF',
                  ),
                  const SizedBox(height: 12),
                  _buildSourceButton(icon: Icons.graphic_eq, label: 'Audio'),
                  const SizedBox(height: 12),
                  _buildSourceButton(
                    icon: Icons.image_outlined,
                    label: 'Image',
                  ),
                  const SizedBox(height: 12),
                  _buildSourceButton(icon: Icons.public, label: 'Website'),
                  const SizedBox(height: 12),
                  _buildSourceButton(
                    icon: Icons.play_circle_fill_outlined,
                    label: 'YouTube',
                  ),
                  const SizedBox(height: 12),
                  _buildSourceButton(
                    icon: Icons.content_paste,
                    label: 'Copied text',
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSourceButton({required IconData icon, required String label}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xFF2E3040),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF3A3D4E), width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedFilter = 'All';
  final List<String> _filters = ['All', 'Notebooks', 'Sources', 'Recent'];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1E27),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Search',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: _buildSearchInput(),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: _filters.map((filter) {
                final isSelected = _selectedFilter == filter;
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedFilter = filter;
                      });
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF6C63FF)
                            : const Color(0xFF1E2030),
                        borderRadius: BorderRadius.circular(20),
                        border: isSelected
                            ? null
                            : Border.all(color: const Color(0xFF3A3D4E)),
                      ),
                      child: Text(
                        filter,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              children: [
                const Text(
                  'Recent',
                  style: TextStyle(
                    color: Color(0xFF8E909B),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                _buildResultCard(
                  icon: Icons.book,
                  iconColor: const Color(0xFF6C63FF),
                  title: 'System Architecture',
                  subtitle: 'Notebook',
                ),
                _buildResultCard(
                  icon: Icons.picture_as_pdf,
                  iconColor: const Color(0xFF3B82F6),
                  title: 'API Documentation 2026',
                  subtitle: 'Source • PDF',
                ),
                _buildResultCard(
                  icon: Icons.play_circle_fill,
                  iconColor: const Color(0xFFFF4444),
                  title: 'State Management Overview',
                  subtitle: 'Source • YouTube',
                ),
                _buildResultCard(
                  icon: Icons.language,
                  iconColor: const Color(0xFF4ADE80),
                  title: 'Flutter Widget Catalog',
                  subtitle: 'Source • Website',
                ),
                const SizedBox(height: 32),
                const Text(
                  'Suggested',
                  style: TextStyle(
                    color: Color(0xFF8E909B),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _buildSuggestedChip('UI Patterns'),
                    _buildSuggestedChip('State Notifiers'),
                    _buildSuggestedChip('Widget Testing'),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchInput() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E2030),
        border: Border.all(color: const Color(0xFF3A3D4E), width: 1.5),
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextField(
        controller: _searchController,
        style: const TextStyle(color: Colors.white),
        onChanged: (text) {
          // Trigger rebuild to toggle the clear icon
          setState(() {});
        },
        decoration: InputDecoration(
          hintText: 'Search notebooks, sources...',
          hintStyle: const TextStyle(color: Color(0xFF8E909B), fontSize: 16),
          prefixIcon: const Icon(Icons.search, color: Color(0xFF8E909B)),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.close, color: Color(0xFF8E909B)),
                  onPressed: () {
                    setState(() {
                      _searchController.clear();
                    });
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  Widget _buildResultCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2030),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF8E909B),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF8E909B),
            size: 14,
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestedChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2030),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF3A3D4E)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isThemeDark = true;
  bool _isNotificationsOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1E27),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        children: [
          _buildProfileCard(),
          const SizedBox(height: 32),
          _buildSectionTitle('Preferences'),
          _buildSettingsGroup(
            children: [
              _buildSettingsItem(
                icon: Icons.dark_mode,
                iconColor: const Color(0xFF6C63FF),
                title: 'Theme',
                trailing: Switch(
                  value: _isThemeDark,
                  onChanged: (val) => setState(() => _isThemeDark = val),
                  activeColor: Colors.white,
                  activeTrackColor: const Color(0xFF6C63FF),
                  inactiveThumbColor: const Color(0xFF8E909B),
                  inactiveTrackColor: const Color(0xFF2A2D3A),
                ),
              ),
              _buildDivider(),
              _buildSettingsItem(
                icon: Icons.language,
                iconColor: const Color(0xFF00D4FF),
                title: 'Language',
                trailing: const Text(
                  'English',
                  style: TextStyle(color: Color(0xFF8E909B), fontSize: 16),
                ),
              ),
              _buildDivider(),
              _buildSettingsItem(
                icon: Icons.notifications,
                iconColor: const Color(0xFFFFB347),
                title: 'Notifications',
                trailing: Switch(
                  value: _isNotificationsOn,
                  onChanged: (val) => setState(() => _isNotificationsOn = val),
                  activeColor: Colors.white,
                  activeTrackColor: const Color(0xFF6C63FF),
                  inactiveThumbColor: const Color(0xFF8E909B),
                  inactiveTrackColor: const Color(0xFF2A2D3A),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSectionTitle('AI Settings'),
          _buildSettingsGroup(
            children: [
              _buildSettingsItem(
                icon: Icons.auto_awesome,
                iconColor: const Color(0xFF4ADE80),
                title: 'Default AI Model',
                trailing: const Text(
                  'Claude Sonnet',
                  style: TextStyle(color: Color(0xFF8E909B), fontSize: 16),
                ),
              ),
              _buildDivider(),
              _buildSettingsItem(
                icon: Icons.translate,
                iconColor: const Color(0xFF3B82F6),
                title: 'Response Language',
                trailing: const Text(
                  'English',
                  style: TextStyle(color: Color(0xFF8E909B), fontSize: 16),
                ),
              ),
              _buildDivider(),
              _buildSettingsItem(
                icon: Icons.format_quote,
                iconColor: const Color(0xFFFF6B6B),
                title: 'Citation Style',
                trailing: const Text(
                  'Inline',
                  style: TextStyle(color: Color(0xFF8E909B), fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSectionTitle('About'),
          _buildSettingsGroup(
            children: [
              _buildSettingsItem(
                icon: Icons.info_outline,
                iconColor: const Color(0xFF8E909B),
                title: 'Version',
                trailing: const Text(
                  '1.0.0 Beta',
                  style: TextStyle(color: Color(0xFF8E909B), fontSize: 16),
                ),
              ),
              _buildDivider(),
              _buildSettingsItem(
                icon: Icons.shield_outlined,
                iconColor: const Color(0xFF8E909B),
                title: 'Privacy Policy',
                trailing: const Icon(
                  Icons.chevron_right,
                  color: Color(0xFF8E909B),
                ),
              ),
              _buildDivider(),
              _buildSettingsItem(
                icon: Icons.description_outlined,
                iconColor: const Color(0xFF8E909B),
                title: 'Terms of Service',
                trailing: const Icon(
                  Icons.chevron_right,
                  color: Color(0xFF8E909B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Sign Out',
                style: TextStyle(
                  color: Color(0xFFFF4444),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2030),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF6C63FF), width: 2.5),
              color: const Color(0xFF2C2E3A),
            ),
            alignment: Alignment.center,
            child: const Text(
              'RK',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'RK User',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'rk@cogniitex.com',
                  style: TextStyle(color: Color(0xFF8E909B), fontSize: 14),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Color(0xFF8E909B)),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF8E909B),
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSettingsGroup({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E2030),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required Widget trailing,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          trailing,
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.only(left: 56.0),
      child: Divider(color: Color(0xFF2A2D3A), height: 1, thickness: 1),
    );
  }
} // end of file
