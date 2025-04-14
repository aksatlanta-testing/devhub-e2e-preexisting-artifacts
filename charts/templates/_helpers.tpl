
{{- define "go-echo084df945-8060-4800-9d08-264c7469a221.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo084df945-8060-4800-9d08-264c7469a221.fullname" -}}
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


{{- define "go-echo084df945-8060-4800-9d08-264c7469a221.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo084df945-8060-4800-9d08-264c7469a221.labels" -}}
helm.sh/chart: {{ include "go-echo084df945-8060-4800-9d08-264c7469a221.chart" . }}
{{ include "go-echo084df945-8060-4800-9d08-264c7469a221.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo084df945-8060-4800-9d08-264c7469a221.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo084df945-8060-4800-9d08-264c7469a221.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}