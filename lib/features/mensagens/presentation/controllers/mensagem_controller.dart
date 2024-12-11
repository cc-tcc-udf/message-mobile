import 'package:campus_connect/features/mensagens/data/models/detalhe_mensagem_model.dart';
import 'package:campus_connect/features/mensagens/data/models/mensagem_model.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/localstorage/security_shared_preference.dart';
import '../../data/models/envio_view_favorite_model.dart';
import '../../data/models/index_model.dart';
import '../../domain/usecases/mensagem_usecase.dart';

part 'mensagem_controller.g.dart';

class MensagemController = MensagemControllerBase with _$MensagemController;

abstract class MensagemControllerBase with Store {
  final MensagemUsecase usecase;
  final SecuritySharedPreference secureStorage = SecuritySharedPreference();

  MensagemControllerBase({
    required this.usecase,
  });

  @observable
  bool isLoading = false;

  @observable
  String error = '';

  @observable
  MensagemModel? mensagem;

  @observable
  bool favorito = false;

  @observable
  DetalheMensagemModel? detalheMensagem;

  @observable
  String? termos = '''
    <p><strong>Política de Privacidade da Campus Connect Ltda.</strong></p>
<p>Seja bem-vindo ao nosso website. Agradecemos o seu interesse em nossa empresa e em nossos produtos. A sua segurança durante a sua visita ao nosso website é extremamente importante para nós e por isso adotamos todas as precauções para garantir que as suas Informações Pessoais estejam protegidas.</p>
<p>Essa política de privacidade (“Política de Privacidade”) descreve as informações que a Campus Connect Ltda. (“Campus Connect”) coleta e armazena sobre você, como as utilizamos, protegemos e compartilhamos suas Informações e escolhas pessoais, sujeita à regulamentação brasileira de proteção de dados pessoais.</p>

<p><strong>Escopo</strong></p>
<p>Essa Política de Privacidade aplica-se às informações coletadas sobre você por ou em nome da Campus Connect conforme descrito na seção “Informações que Coletamos” abaixo, inclusive através de websites, aplicativos de celular e serviços online ou programas onde essa Política de Privacidade esteja postada ou vinculada (nossos “Serviços Online”). Salvo indicação contrária, todas as referências a “Campus Connect”, “nós” ou “nosso(a)” na presente Política de Privacidade significam a Campus Connect Ltda. A presente Política de Privacidade não se aplica a quaisquer de nossas afiliadas, outras empresas da Campus Connect, que são terceiros independentes.</p>

<p><strong>Consentimento</strong></p>
<p>Quando razoavelmente praticável ou conforme exigido pela lei aplicável, nós solicitaremos o seu consentimento antes de coletar ou utilizar as suas Informações Pessoais. A solicitação de consentimento será clara e apresentará informações razoáveis para que você tome sua decisão. O seu consentimento pode ser revogado a qualquer momento, por exemplo, após a prestação de um serviço específico ou por meio de contato com a Campus Connect no endereço indicado na seção “Fale Conosco” abaixo.</p>

<p><strong>Aviso</strong></p>
<p>Quando razoavelmente praticável ou conforme exigido pela lei aplicável, nós, para coletar ou armazenar suas Informações Pessoais, disponibilizaremos a você (i) informações específicas sobre as finalidades do processamento das suas Informações Pessoais, (ii) a identidade do controlador das Informações, (iii) as identidades de quaisquer terceiros para os quais as suas Informações Pessoais possam ser compartilhadas, e (iv) outras informações necessárias para garantir que você possa proteger os seus direitos.</p>

<p><strong>Retenção</strong></p>
<p>Nós somente armazenamos as suas Informações Pessoais pelo tempo necessário para cumprir as finalidades descritas nesta Política de Privacidade ou para outras finalidades sobre as quais você tenha sido informado de outra forma.</p>
<p>Isso significa que quando você der seu consentimento para processarmos suas Informações Pessoais, nós as manteremos de acordo com tal consentimento e/ou até que você o revogue. Se você revogar o seu consentimento, ainda assim nós poderemos manter algumas de suas Informações Pessoais pelo tempo necessário para cumprirmos nossas obrigações legais e defendermos os nossos interesses em caso de litígios. Se não for obtido o seu consentimento para o processamento das suas Informações Pessoais, as mesmas somente serão mantidas pelo período permitido por lei.</p>

<p><strong>Links, Websites de Terceiros e Plataformas de Mídias Sociais</strong></p>
<p>Nossos Serviços Online podem conter links para websites de outras empresas Campus Connect ou outros terceiros, bem como para as plataformas de mídias sociais, como Facebook ou Twitter (“Sites Vinculados”). A Campus Connect não é responsável e não se responsabilizará pelas práticas ou políticas de privacidade dos Sites Vinculados. Recomendamos que você reveja as políticas de privacidade de cada Site Vinculado que visitar.</p>

<p><strong>Informações que Coletamos</strong></p>
<p>Para os fins desta Política de Privacidade, “Informações Pessoais” significa toda informação que pode ser utilizada para identificar um indivíduo específico, como o nome, endereço de e-mail, número de telefone, número da carteira de habilitação ou número do cartão de crédito. “Informações” é coletivamente utilizado nessa Política de Privacidade para se referir tanto às Informações Pessoais como às outras informações que não identifiquem um indivíduo específico.</p>

<p><strong>Informações que Você Nos Fornece</strong></p>
<p>Nós coletamos Informações Pessoais quando você:</p>
<ul>
  <li>Faz um cadastro com qualquer um dos nossos produtos ou serviços através de nós ou através de uma das faculdades que nos contrataram;</li>
  <li>Se cadastra em qualquer evento ou programa Campus Connect e/ou participa de qualquer evento, programa, concurso, pesquisa ou outra promoção que possa ser oferecida por nós de tempos em tempos (em conjunto, “Eventos”);</li>
  <li>Assina a Revista Campus Connect ou outros de nossos meios de comunicação;</li>
  <li>Entra em contato ou se comunica conosco;</li>
  <li>Solicita informações;</li>
  <li>Acessa ou usa as páginas ou contas da Campus Connect em qualquer plataforma de mídia social de terceiros, como o Facebook ou Twitter (“Páginas de Mídia Social”);</li>
  <li>Fornece ou envia comentários, sugestões, experiências ou outros conteúdos para nós;</li>
  <li>E/ou de qualquer outra forma interage conosco e com os nossos Serviços Online.</li>
</ul>

<p><strong>Como Utilizamos Suas Informações</strong></p>
<p>Nós utilizamos suas Informações, inclusive as Informações Pessoais, exclusivamente para fins comerciais, incluindo:</p>
<ul>
  <li>Fornecer nossos produtos e serviços a você;</li>
  <li>Comunicá-lo sobre a Campus Connect e seus produtos, serviços e Eventos;</li>
  <li>Personalizar a sua experiência Campus Connect;</li>
  <li>Responder as suas perguntas, comentários e postagens;</li>
  <li>Administrar os nossos Eventos;</li>
  <li>Melhorar e personalizar os nossos Serviços Online;</li>
  <li>Enviar-lhe e-mails sobre nossos produtos e serviços;</li>
  <li>Gerenciar nossos relacionamentos com você;</li>
  <li>Cumprir com as obrigações legais ou regulatórias;</li>
  <li>E/ou de outra forma conforme necessário para os nossos legítimos interesses comerciais.</li>
</ul>

<p><strong>Como Protegemos Suas Informações</strong></p>
<p>Utilizamos medidas de segurança físicas, técnicas e administrativas para proteger suas Informações Pessoais contra perda, roubo, uso indevido e acesso não autorizado, divulgação, alteração e destruição. No entanto, nenhuma transmissão de dados pela internet ou sistema de armazenamento de dados pode ser 100% segura. Embora nos esforcemos para proteger suas Informações Pessoais, não podemos garantir a segurança total de qualquer informação transmitida para ou de nossos Serviços Online.</p>

<p><strong>Seus Direitos e Escolhas</strong></p>
<p>Você tem o direito de acessar, corrigir, excluir ou restringir o processamento das suas Informações Pessoais, conforme permitido pela legislação aplicável. Se você desejar acessar ou corrigir as suas Informações Pessoais, ou se quiser retirar seu consentimento para o processamento de suas Informações Pessoais, você pode fazer isso entrando em contato conosco conforme descrito abaixo.</p>

<p><strong>Alterações à Política de Privacidade</strong></p>
<p>Podemos atualizar esta Política de Privacidade periodicamente para refletir mudanças nas nossas práticas de privacidade ou nas exigências legais. Quando fizermos alterações significativas na política, postaremos uma atualização nesta página e, se apropriado, notificaremos você sobre as mudanças.</p>

<p><strong>Fale Conosco</strong></p>
<p>Se você tiver dúvidas ou preocupações sobre a sua privacidade ou sobre o tratamento das suas Informações Pessoais, ou se desejar exercer seus direitos conforme descrito nesta Política de Privacidade, entre em contato conosco pelo seguinte endereço:</p>
<p>Data de Vigência: AVISO LEGAL Copyright © 2024 Campus Connect Ltda.</p>
  ''';

  @observable
  IndexModel? index;

  @action
  Future<MensagemModel?> listarMensagens(String id, String flag) async {
    isLoading = true;
    error = '';
    try {
      mensagem = await usecase.listarMensagens(id, flag);
    } catch (e) {
      error = e.toString();
      mensagem = null;
    } finally {
      isLoading = false;
    }
    return null;
  }

  @action
  Future<DetalheMensagemModel?> detalhesMensagem(String id, String idAluno) async {
    isLoading = true;
    error = '';
    try {
      detalheMensagem = await usecase.detalheMensagem(id, idAluno);
    } catch (e) {
      error = e.toString();
      mensagem = null;
    } finally {
      isLoading = false;
    }
    return null;
  }

  @action
  Future<IndexModel?> indexMensagens(String id) async {
    isLoading = true;
    error = '';
    try {
      index = await usecase.indexMensagens(id);
    } catch (e) {
      error = e.toString();
      mensagem = null;
    } finally {
      isLoading = false;
    }
    return null;
  }

  @action
  Future<dynamic> viewFavorite(EnvioViewFavoriteModel envio) async {
    isLoading = true;
    error = '';
    try {
      await usecase.viewFavorite(envio);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
    return null;
  }
}
