
{{- define "go-echo33e26d6d-af42-4f19-bb39-c9597d898f61.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo33e26d6d-af42-4f19-bb39-c9597d898f61.fullname" -}}
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


{{- define "go-echo33e26d6d-af42-4f19-bb39-c9597d898f61.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo33e26d6d-af42-4f19-bb39-c9597d898f61.labels" -}}
helm.sh/chart: {{ include "go-echo33e26d6d-af42-4f19-bb39-c9597d898f61.chart" . }}
{{ include "go-echo33e26d6d-af42-4f19-bb39-c9597d898f61.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo33e26d6d-af42-4f19-bb39-c9597d898f61.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo33e26d6d-af42-4f19-bb39-c9597d898f61.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}