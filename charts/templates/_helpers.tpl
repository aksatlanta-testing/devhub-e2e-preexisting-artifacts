
{{- define "go-echoe0e2bf89-b25e-43c6-9762-94fd29ee3dee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe0e2bf89-b25e-43c6-9762-94fd29ee3dee.fullname" -}}
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


{{- define "go-echoe0e2bf89-b25e-43c6-9762-94fd29ee3dee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe0e2bf89-b25e-43c6-9762-94fd29ee3dee.labels" -}}
helm.sh/chart: {{ include "go-echoe0e2bf89-b25e-43c6-9762-94fd29ee3dee.chart" . }}
{{ include "go-echoe0e2bf89-b25e-43c6-9762-94fd29ee3dee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe0e2bf89-b25e-43c6-9762-94fd29ee3dee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe0e2bf89-b25e-43c6-9762-94fd29ee3dee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}