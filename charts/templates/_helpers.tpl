
{{- define "go-echoae49f8ad-d33d-44d4-ab7a-629ce0a071ea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae49f8ad-d33d-44d4-ab7a-629ce0a071ea.fullname" -}}
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


{{- define "go-echoae49f8ad-d33d-44d4-ab7a-629ce0a071ea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae49f8ad-d33d-44d4-ab7a-629ce0a071ea.labels" -}}
helm.sh/chart: {{ include "go-echoae49f8ad-d33d-44d4-ab7a-629ce0a071ea.chart" . }}
{{ include "go-echoae49f8ad-d33d-44d4-ab7a-629ce0a071ea.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoae49f8ad-d33d-44d4-ab7a-629ce0a071ea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoae49f8ad-d33d-44d4-ab7a-629ce0a071ea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}