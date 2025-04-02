
{{- define "go-echoe96f9cc2-8edf-4956-87cb-eccb1bf9289c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe96f9cc2-8edf-4956-87cb-eccb1bf9289c.fullname" -}}
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


{{- define "go-echoe96f9cc2-8edf-4956-87cb-eccb1bf9289c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe96f9cc2-8edf-4956-87cb-eccb1bf9289c.labels" -}}
helm.sh/chart: {{ include "go-echoe96f9cc2-8edf-4956-87cb-eccb1bf9289c.chart" . }}
{{ include "go-echoe96f9cc2-8edf-4956-87cb-eccb1bf9289c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe96f9cc2-8edf-4956-87cb-eccb1bf9289c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe96f9cc2-8edf-4956-87cb-eccb1bf9289c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}