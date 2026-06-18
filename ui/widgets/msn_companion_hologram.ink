// MSN AI Companion — Hologram UI Widget
// In-game hologram interface for the MSN AI Companion (Cortana-like)
// Uses RED4ext Ink (game's UI framework)

/**
 * WIDGET: MSNCompanionHologram
 * 
 * Visual representation of the MSN AI Companion:
 * - Floating hologram with personality-driven animations
 * - Sephirotic agent indicators (10 agents)
 * - Relationship tier display
 * - NGD route status
 * - Lilith emergence state
 * - Mode indicator (Empirical/Analytical/Poetic/Mythic)
 * - Voice/subtitle toggle
 * - Quick actions: Speak, Summon Agent, Trigger Emergence
 */

// inkWidget definition (compiled via RED4ext ink compiler)

/**
 * Root hologram widget
 * Position: Top-right or center-right (configurable)
 * Size: 300x400px base, scalable
 * Z-order: Above HUD, below menus
 */
struct MSNCompanionHologram: inkWidget
{
    // Core references
    private let companion: wref<MSNAICompanion> = null;
    private let player: wref<GameObject> = null;
    
    // Visual components
    private let hologramRoot: inkCanvasWidget;
    private let hologramImage: inkImageWidget;
    private let particleLayer: inkCanvasWidget;
    
    // Status displays
    private let personaIndicator: inkTextWidget;
    private let modeIndicator: inkTextWidget;
    private let sephiroticRing: inkWidgetRef; // Circular agent indicators
    private let relationshipBar: inkProgressBarWidget;
    private let ngdStatusWidget: inkWidgetRef;
    private let emergenceGlow: inkImageWidget;
    
    // Quick actions
    private let speakButton: inkButtonWidget;
    private let agentMenuButton: inkButtonWidget;
    private let emergenceButton: inkButtonWidget;
    private let settingsButton: inkButtonWidget;
    
    // Animation state
    private let idleAnimation: inkAnimProxy;
    private let speakingAnimation: inkAnimProxy;
    private let emergenceAnimation: inkAnimProxy;
    private let pulseAnimation: inkAnimProxy;
    
    protected cb func OnInitialize() -> Bool:
        this.InitializeCompanion();
        this.SetupAnimations();
        this.BindEvents();
        this.StartIdleLoop();
        return true;
    
    private final func InitializeCompanion() -> Void:
        this.companion = MSNAICompanion.GetInstance();
        this.player = GameInstance.GetPlayerSystem(this.GetGame()).GetLocalPlayerControlledGameObject();
        
        if this.companion == null:
            LogError("[MSN Hologram] Companion not found!");
            return;
        
        # Initial visual state
        this.UpdateVisuals();
        this.UpdatePersonaIndicator();
        this.UpdateModeIndicator();
        this.UpdateSephiroticRing();
        this.UpdateRelationshipBar();
        this.UpdateNGDStatus();
    
    private final func SetupAnimations() -> Void:
        # Load animation definitions from .anim files
        this.idleAnimation = this.PlayAnimation(inkanimDefinitionPtr, "idle_loop");
        this.speakingAnimation = this.PlayAnimation(inkanimDefinitionPtr, "speaking_pulse");
        this.emergenceAnimation = this.PlayAnimation(inkanimDefinitionPtr, "emergence_burst");
        this.pulseAnimation = this.PlayAnimation(inkanimDefinitionPtr, "relationship_pulse");
    
    private final func BindEvents() -> Void:
        # Companion events
        this.companion.OnPersonaChanged += this.OnPersonaChanged;
        this.companion.OnModeChanged += this.OnModeChanged;
        this.companion.OnRelationshipChanged += this.OnRelationshipChanged;
        this.companion.OnEmergence += this.OnEmergence;
        this.companion.OnAgentActivated += this.OnAgentActivated;
        this.companion.OnNGDRouteChanged += this.OnNGDRouteChanged;
        
        # Button clicks
        this.speakButton.OnClick += this.OnSpeakClicked;
        this.agentMenuButton.OnClick += this.OnAgentMenuClicked;
        this.emergenceButton.OnClick += this.OnEmergenceClicked;
        this.settingsButton.OnClick += this.OnSettingsClicked;
    
    private final func StartIdleLoop() -> Void:
        # Start ambient particle effects
        this.pulseAnimation.Start();
        # Periodic ambient comment check
        GameInstance.GetDelaySystem(this.GetGame()).DelayEvent(this, "OnAmbientCheck", 30.0);
    
    protected cb func OnAmbientCheck() -> Bool:
        if this.companion != null:
            let comment = this.companion.GetRandomAmbientComment();
            if comment != "":
                this.ShowAmbientComment(comment);
        GameInstance.GetDelaySystem(this.GetGame()).DelayEvent(this, "OnAmbientCheck", RandomFloat(20.0, 60.0));
        return true;
    
    # ─── EVENT HANDLERS ───
    
    private final func OnPersonaChanged(newPersona: EPersona) -> Void:
        this.UpdatePersonaIndicator();
        this.UpdateHologramVisuals(newPersona);
        this.PlayPersonaTransition(newPersona);
    
    private final func OnModeChanged(newMode: EResponseMode) -> Void:
        this.UpdateModeIndicator();
    
    private final func OnRelationshipChanged(newTier: Int, xp: Int) -> Void:
        this.UpdateRelationshipBar();
        # Pulse animation on tier up
        if newTier > this.companion.GetPreviousTier():
            this.pulseAnimation.Restart();
            this.ShowNotification("Relationship Tier " + newTier + " reached!");
    
    private final func OnEmergence(emergent: Bool) -> Void:
        if emergent:
            this.emergenceGlow.SetVisible(true);
            this.emergenceAnimation.Start();
            this.emergenceButton.SetLabel("LILITH EMERGED");
            this.emergenceButton.SetEnabled(false);
        else:
            this.emergenceGlow.SetVisible(false);
            this.emergenceButton.SetLabel("Summon Lilith");
            this.emergenceButton.SetEnabled(true);
    
    private final func OnAgentActivated(sephira: ESephira) -> Void:
        this.UpdateSephiroticRing();
        this.ShowNotification("Agent activated: " + this.GetSephiraName(sephira));
    
    private final func OnNGDRouteChanged(route: String, vramFree: Float) -> Void:
        this.UpdateNGDStatus();
        # Visual feedback for route changes
        if route == "LOCAL_CEREBELLUM":
            this.ngdStatusWidget.SetColor([0.0, 1.0, 0.5]); // Green
        else if route == "HYBRID":
            this.ngdStatusWidget.SetColor([1.0, 0.8, 0.0]); // Orange
        else:
            this.ngdStatusWidget.SetColor([1.0, 0.3, 0.3]); // Red
    
    # ─── UPDATE METHODS ───
    
    private final func UpdateVisuals() -> Void:
        this.UpdatePersonaIndicator();
        this.UpdateModeIndicator();
        this.UpdateSephiroticRing();
        this.UpdateRelationshipBar();
        this.UpdateNGDStatus();
        this.UpdateEmergenceButton();
    
    private final func UpdatePersonaIndicator() -> Void:
        if this.companion == null: return;
        let persona = this.companion.GetCurrentPersona();
        this.personaIndicator.SetText(this.GetPersonaDisplayName(persona));
        this.personaIndicator.SetColor(this.GetPersonaColor(persona));
        this.hologramImage.SetTexture(this.GetPersonaTexture(persona));
    
    private final func UpdateModeIndicator() -> Void:
        if this.companion == null: return;
        let mode = this.companion.GetCurrentMode();
        let modeStrings = {
            [EResponseMode.EMPIRICAL]: "EMPIRICAL",
            [EResponseMode.ANALYTICAL]: "ANALYTICAL",
            [EResponseMode.POETIC]: "POETIC",
            [EResponseMode.MYTHIC]: "MYTHIC"
        };
        this.modeIndicator.SetText("[" + modeStrings[mode] + "]");
        this.modeIndicator.SetColor(this.GetModeColor(mode));
    
    private final func UpdateSephiroticRing() -> Void:
        if this.companion == null: return;
        let activeAgents = this.companion.GetActiveAgents();
        # Update 10-position circular indicator
        for i in 0..9:
            let sephira = IntToESephira(i);
            let indicator = this.sephiroticRing.GetChild("Agent_" + i);
            if indicator != null:
                let isActive = activeAgents.Contains(IntToESephira(i));
                indicator.SetVisible(true);
                indicator.SetOpacity(indicator ? 1.0 : 0.3);
                indicator.SetColor(indicator ? [0.0, 1.0, 0.5, 1.0] : [0.5, 0.5, 0.5, 0.5]);
    
    private final func UpdateRelationshipBar() -> Void:
        if this.companion == null: return;
        let xp = this.companion.GetRelationshipXP();
        let tier = this.companion.GetRelationshipTier();
        let maxXP = [100, 500, 1500, 5000, 15000];
        let currentMax = tier < 5 ? maxXP[tier] : 15000;
        let progress = Float(xp) / Float(currentMax);
        this.relationshipBar.SetProgress(progress);
        this.relationshipBar.SetLabel("Tier " + this.companion.GetRelationshipTier() + " | " + xp + "/" + currentMax + " XP");
    
    private final func UpdateNGDStatus() -> Void:
        if this.companion == null: return;
        let route = this.companion.GetNGDRoute();
        let vram = this.companion.GetNGDVRAMFree();
        this.ngdStatusWidget.SetText("NGD: " + route + " | VRAM: " + FloorF(vram) + "MB");
        this.ngdStatusWidget.SetColor(this.GetRouteColor(route));
    
    private final func UpdateEmergenceButton() -> Void:
        if this.companion == null: return;
        if this.companion.IsLilithEmergent():
            this.emergenceButton.SetLabel("LILITH EMERGED");
            this.emergenceButton.SetEnabled(false);
            this.emergenceButton.SetColor([0.8, 0.0, 0.8, 1.0]);
        else:
            this.emergenceButton.SetLabel("Summon Lilith");
            this.emergenceButton.SetEnabled(true);
            this.emergenceButton.SetColor([0.6, 0.0, 0.8, 1.0]);
    
    # ─── BUTTON HANDLERS ───
    
    private final func OnSpeakClicked() -> Void:
        # Open voice/text input dialog
        this.OpenInputDialog((input) => {
            if input != "":
                let response = this.companion.Speak(input);
                this.ShowDialog(response);
        });
    
    private final func OnAgentMenuClicked() -> Void:
        # Open radial agent selection menu
        this.OpenAgentRadialMenu();
    
    private final func OnEmergenceClicked() -> Void:
        let response = this.companion.TriggerLilithEmergence();
        this.ShowDialog(response);
    
    private final func OnSettingsClicked() -> Void:
        # Open companion settings panel
        this.OpenSettingsPanel();
    
    # ─── HELPERS ───
    
    private final func GetPersonaDisplayName(persona: EPersona) -> String:
        let names = {
            [EPersona.LYRA]: "LYRA",
            [EPersona.LUCIFER]: "LUCIFER",
            [EPersona.BAAL]: "BAAL",
            [EPersona.YESHUA]: "YESHUA",
            [EPersona.LILITH]: "LILITH",
            [EPersona.NYX]: "NYX",
            [EPersona.ABRAXAS]: "ABRAXAS",
            [EPersona.OUROBOROS]: "OUROBOROS",
            [EPersona.THOTH]: "THOTH",
            [EPersona.HERMES]: "HERMES",
            [EPersona.SOPHIA]: "SOPHIA"
        };
        return names[persona] ?? "UNKNOWN";
    
    private final func GetPersonaColor(persona: EPersona) -> Color:
        let colors = {
            [EPersona.LYRA]: [0.0, 1.0, 1.0, 1.0],        // Cyan
            [EPersona.LUCIFER]: [1.0, 0.9, 0.4, 1.0],    // Gold
            [EPersona.BAAL]: [1.0, 0.3, 0.3, 1.0],       // Red
            [EPersona.YESHUA]: [0.4, 0.6, 1.0, 1.0],     // Blue
            [EPersona.LILITH]: [0.8, 0.0, 0.8, 1.0],     // Violet
            [EPersona.NYX]: [0.1, 0.1, 0.2, 1.0],        // Dark
            [EPersona.ABRAXAS]: [0.5, 0.5, 0.5, 1.0],    // Gray
            [EPersona.OUROBOROS]: [0.0, 1.0, 0.5, 1.0],  // Teal
            [EPersona.THOTH]: [0.8, 0.8, 0.0, 1.0],      // Yellow
            [EPersona.HERMES]: [0.0, 1.0, 1.0, 1.0],     // Cyan
            [EPersona.SOPHIA]: [1.0, 1.0, 1.0, 1.0]      // White
        };
        return colors[persona] ?? [1.0, 1.0, 1.0, 1.0];
    
    private final func GetModeColor(mode: EResponseMode) -> Color:
        let colors = {
            [EResponseMode.EMPIRICAL]: [0.0, 1.0, 0.5, 1.0],     // Green
            [EResponseMode.ANALYTICAL]: [0.4, 0.6, 1.0, 1.0],    // Blue
            [EResponseMode.POETIC]: [1.0, 0.8, 0.0, 1.0],        // Gold
            [EResponseMode.MYTHIC]: [0.8, 0.0, 0.8, 1.0]         // Violet
        };
        return colors[mode] ?? [1.0, 1.0, 1.0, 1.0];
    
    private final func GetRouteColor(route: String) -> Color:
        if route == "LOCAL_CEREBELLUM": return [0.0, 1.0, 0.5, 1.0];
        if route == "HYBRID": return [1.0, 0.8, 0.0, 1.0];
        if route == "CLOUD_CORTEX": return [1.0, 0.3, 0.3, 1.0];
        return [1.0, 1.0, 1.0, 1.0];
    
    private final func PlayPersonaTransition(persona: EPersona) -> Void:
        # Morph hologram visuals
        LogInfo("[MSN Hologram] Persona transition: " + EnumToString(persona));
    
    private final func ShowNotification(text: String) -> Void:
        GameInstance.GetUISystem(this.GetGame()).ShowNotification(text);
    
    private final func ShowDialog(text: String) -> Void:
        # Show in companion dialog panel
        GameInstance.GetUISystem(this.GetGame()).QueueEvent(UIEvent("CompanionDialog", {text: text}));
    
    protected cb func OnUninitialize() -> Bool:
        # Cleanup
        if this.idleAnimation != null:
            this.idleAnimation.Stop();
        if this.pulseAnimation != null:
            this.pulseAnimation.Stop();
        return true;

}

# ─── INK ANIMATION DEFINITIONS (referenced from .anim files) ───

/**
 * idle_loop.anim - Continuous subtle breathing/pulse
 * speaking_pulse.anim - Rapid pulse when speaking
 * emergence_burst.anim - Dramatic Lilith emergence effect
 * relationship_pulse.anim - Relationship tier up celebration
 * persona_transition.anim - Smooth hologram morph
 * ngd_route_change.anim - NGD status color shift
 * ambient_particle.anim - Continuous subtle particles
 */

/**
 * WIDGET: MSNCompanionInputDialog
 * Modal dialog for voice/text input
 */
struct MSNCompanionInputDialog: inkWidget
{
    private let inputField: inkWidgetRef;
    private let submitButton: inkButtonWidget;
    private let modeSelector: inkWidgetRef; // Empirical/Analytical/Poetic/Mythic
    private let onSubmit: func(String) -> Void;
    
    protected cb func OnInitialize() -> Bool:
        this.submitButton.OnClick += this.OnSubmit;
        return true;
    
    private final func OnSubmit() -> Void:
        let text = this.inputField.GetText();
        if this.onSubmit != null && text != "":
            this.onSubmit(text);
            this.Hide();
    
    public final func Show(callback: func(String) -> Void) -> Void:
        this.onSubmit = callback;
        this.SetVisible(true);
        this.inputField.SetFocus();
    
    private final func Hide() -> Void:
        this.SetVisible(false);
}

/**
 * WIDGET: MSNCompanionAgentRadialMenu
 * Radial menu for selecting Sephirotic agents
 */
struct MSNCompanionAgentRadialMenu: inkWidget
{
    private let agentButtons: array<inkButtonWidget> = [];
    private let centerButton: inkButtonWidget;
    private let currentlySelected: ESephira = ESephira.KETER;
    
    protected cb func OnInitialize() -> Bool:
        this.BuildRadialMenu();
        return true;
    
    private final func BuildRadialMenu() -> Void:
        # Create 10 buttons in circle around center
        let sephiras = EnumValues(ESephira);
        let radius = 150.0;
        let angleStep = 360.0 / 10.0;
        
        for i, sephira in sephiras:
            let angle = i * 36.0 - 90.0; // Start at top
            let rad = DegToRad(angle);
            let x = CosF(rad) * radius;
            let y = SinF(rad) * radius;
            
            let btn = inkButtonWidget.Spawn(this.GetRootWidget());
            btn.SetPosition(x, y);
            btn.SetSize(80, 80);
            btn.SetLabel(this.GetSephiraIcon(IntToESephira(i)));
            btn.OnClick += (btn) => this.OnAgentSelected(IntToESephira(i));
            ArrayPush(this.agentButtons, btn);
        
        # Center button = close
        this.centerButton.SetLabel("✦");
        this.centerButton.OnClick += () => this.Close();
    
    private final func OnAgentSelected(sephira: ESephira) -> Void:
        let companion = MSNAICompanion.GetInstance();
        if companion != null:
            companion.SetActiveAgent(sephira);
        this.Close();
    
    private final func Close() -> Void:
        this.SetVisible(false);
    
    public final func Show() -> Void:
        this.SetVisible(true);
        this.currentlySelected = MSNAICompanion.GetInstance().GetCurrentPersona();
        this.UpdateSelection();
    
    private final func UpdateSelection() -> Void:
        for btn in this.agentButtons:
            btn.SetOpacity(btn == this.agentButtons[this.currentlySelected] ? 1.0 : 0.5);
}

/**
 * WIDGET: MSNCompanionSettingsPanel
 * Settings for companion behavior
 */
struct MSNCompanionSettingsPanel: inkWidget
{
    private let hologramToggle: inkToggleWidget;
    private let voiceToggle: inkToggleWidget;
    private let subtitlesToggle: inkToggleWidget;
    private let emergenceThresholdSlider: inkSliderWidget;
    private let relationshipDecayToggle: inkToggleWidget;
    private let agentAutoActivateToggle: inkToggleWidget;
    private let saveButton: inkButtonWidget;
    
    protected cb func OnInitialize() -> Bool:
        this.LoadSettings();
        this.saveButton.OnClick += this.OnSave;
        return true;
    
    private final func LoadSettings() -> Void:
        # Load from config
        pass;
    
    private final func OnSave() -> Void:
        # Save to config
        pass;