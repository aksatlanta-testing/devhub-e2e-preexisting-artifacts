
{{- define "go-echo46dcdbea-d4a5-45e3-8004-727dfcd66caf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo46dcdbea-d4a5-45e3-8004-727dfcd66caf.fullname" -}}
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


{{- define "go-echo46dcdbea-d4a5-45e3-8004-727dfcd66caf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo46dcdbea-d4a5-45e3-8004-727dfcd66caf.labels" -}}
helm.sh/chart: {{ include "go-echo46dcdbea-d4a5-45e3-8004-727dfcd66caf.chart" . }}
{{ include "go-echo46dcdbea-d4a5-45e3-8004-727dfcd66caf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo46dcdbea-d4a5-45e3-8004-727dfcd66caf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo46dcdbea-d4a5-45e3-8004-727dfcd66caf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}