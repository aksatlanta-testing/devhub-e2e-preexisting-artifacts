
{{- define "go-echoceab991e-d701-4faa-ab30-f92c229675af.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoceab991e-d701-4faa-ab30-f92c229675af.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoceab991e-d701-4faa-ab30-f92c229675af.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoceab991e-d701-4faa-ab30-f92c229675af.labels" -}}
helm.sh/chart: {{ include "go-echoceab991e-d701-4faa-ab30-f92c229675af.chart" . }}
{{ include "go-echoceab991e-d701-4faa-ab30-f92c229675af.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoceab991e-d701-4faa-ab30-f92c229675af.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoceab991e-d701-4faa-ab30-f92c229675af.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}