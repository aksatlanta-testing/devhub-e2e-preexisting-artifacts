
{{- define "go-echoaad8a635-67ec-48ab-90da-219e575b431f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaad8a635-67ec-48ab-90da-219e575b431f.fullname" -}}
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


{{- define "go-echoaad8a635-67ec-48ab-90da-219e575b431f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaad8a635-67ec-48ab-90da-219e575b431f.labels" -}}
helm.sh/chart: {{ include "go-echoaad8a635-67ec-48ab-90da-219e575b431f.chart" . }}
{{ include "go-echoaad8a635-67ec-48ab-90da-219e575b431f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaad8a635-67ec-48ab-90da-219e575b431f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaad8a635-67ec-48ab-90da-219e575b431f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}