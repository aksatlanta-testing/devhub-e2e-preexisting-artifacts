
{{- define "go-echo9f48c75c-06c9-409d-8732-735bb634c05a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9f48c75c-06c9-409d-8732-735bb634c05a.fullname" -}}
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


{{- define "go-echo9f48c75c-06c9-409d-8732-735bb634c05a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9f48c75c-06c9-409d-8732-735bb634c05a.labels" -}}
helm.sh/chart: {{ include "go-echo9f48c75c-06c9-409d-8732-735bb634c05a.chart" . }}
{{ include "go-echo9f48c75c-06c9-409d-8732-735bb634c05a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9f48c75c-06c9-409d-8732-735bb634c05a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9f48c75c-06c9-409d-8732-735bb634c05a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}