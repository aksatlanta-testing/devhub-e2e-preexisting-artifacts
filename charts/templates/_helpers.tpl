
{{- define "go-echo49e33a0e-38fd-4e5c-a27a-40ef78b13bfc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo49e33a0e-38fd-4e5c-a27a-40ef78b13bfc.fullname" -}}
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


{{- define "go-echo49e33a0e-38fd-4e5c-a27a-40ef78b13bfc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo49e33a0e-38fd-4e5c-a27a-40ef78b13bfc.labels" -}}
helm.sh/chart: {{ include "go-echo49e33a0e-38fd-4e5c-a27a-40ef78b13bfc.chart" . }}
{{ include "go-echo49e33a0e-38fd-4e5c-a27a-40ef78b13bfc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo49e33a0e-38fd-4e5c-a27a-40ef78b13bfc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo49e33a0e-38fd-4e5c-a27a-40ef78b13bfc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}