
{{- define "go-echo837fb38b-8322-4a82-b6ed-ce72a1afc010.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo837fb38b-8322-4a82-b6ed-ce72a1afc010.fullname" -}}
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


{{- define "go-echo837fb38b-8322-4a82-b6ed-ce72a1afc010.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo837fb38b-8322-4a82-b6ed-ce72a1afc010.labels" -}}
helm.sh/chart: {{ include "go-echo837fb38b-8322-4a82-b6ed-ce72a1afc010.chart" . }}
{{ include "go-echo837fb38b-8322-4a82-b6ed-ce72a1afc010.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo837fb38b-8322-4a82-b6ed-ce72a1afc010.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo837fb38b-8322-4a82-b6ed-ce72a1afc010.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}